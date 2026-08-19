from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional

app = FastAPI(
    title="Stitch API",
    description="Backend API service for Stitch Cyberpunk Social Activity Hub",
    version="1.0.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class VibeItem(BaseModel):
    id: str
    title: str
    category: str
    location: str
    distance: str
    imageUrl: str
    tag: str
    stitchingCount: int
    avatars: List[str]


class HangoutItem(BaseModel):
    id: str
    title: str
    location: str
    timeStatus: str
    currentCapacity: int
    maxCapacity: int


class BadgeItem(BaseModel):
    id: str
    title: str
    subtitle: str
    iconName: str
    colorHex: str
    isLocked: bool


class ActivityFeedItem(BaseModel):
    id: str
    title: str
    subtitle: str
    iconName: str
    colorHex: str


class ProfileResponse(BaseModel):
    username: str
    tagline: str
    avatarUrl: str
    level: int
    currentXp: int
    maxXp: int
    questsCount: int
    connectionsCount: int
    badgesCount: int
    badges: List[BadgeItem]
    recentIntel: List[ActivityFeedItem]


@app.get("/")
def root():
    return {"message": "Stitch Cyberpunk API is online", "status": "ok"}


@app.get("/api/v1/vibes", response_model=List[VibeItem])
def get_vibes():
    return [
        VibeItem(
            id="vibe-1",
            title="Late Night Ramen",
            category="Food & Drink",
            location="Cyber Noodle Bar",
            distance="0.8 mi away",
            imageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuCvf9h8lcOCXNSPHYSmnz23JJPfJqZtYreWb2630WRIQlobzrOViAUg2HyyRNOTGoOQETPwu336_QMJnR36zjNnrM5U64ADJGyLP-hFTrmxH5YtoMIH42cN2eA6cJ_0F9khtYde8v-6P6LJbiU4G8pR3xXZPzbkXAe_sPFM_ZQ0JQcPf_LrScSjDp_d-rvc6f_4Fjuyt9VzAFBRmg2UzaRvxHYoAFuaFARphXbI1qgZ9H-1hzpgPmB8",
            tag="Hot Now",
            stitchingCount=24,
            avatars=[
                "https://lh3.googleusercontent.com/aida-public/AB6AXuBli6YWHGiXPCgUmBND8i7y6GUhdTNr1y1dsGQCJpq88Cr2JiEwyCxRersttwHqkN2LPMe2Z_3hsvrEp_tcZcYAZM_h8-kR2hKAo24IZlVXE3IBN4kuIcQKDAyGhBgYpM10ryfynOyQvU8yuTQCdxQm9i7W2eNcSL2FfsU6zYrCXq9HnBTHidQu4ItnG53_8Y338sVt1A7wSmxXFoFybkZkoETgI1eFVBjGXLw88n7LwSDh2gEx8f_T",
                "https://lh3.googleusercontent.com/aida-public/AB6AXuBs4PUfCAOjHgYfvwqr6fyf3dPe6Xl4EWY27wvHliPTVSgj5kK-Im1hI8e4XHNsVGOp5iXaQywyCL8HXFz_auojsQkj0JSpa7qL9_SmD0DdzUS4HeLV_pY-JhgEv7eJSbqN8rx4tokWkiPKeMxTe_syaxjkJg52NT5hAhlQrt6ndjctL9Z1Mv6wXsB2F2_vhSZBZc0dkRYMbr_dy8WPCk3T2X5d_5rbAvXhcsVzae6sorFFc08fbea1",
                "https://lh3.googleusercontent.com/aida-public/AB6AXuDH4gwZzU-XtgwBZf1fgVibXqJR92x-ytz5fSFb0ChKQ1MYUgchpiOgxYsGftPo9KBNs6BQnan-lj4mQQXa8cL5Yh4PRdBz0l60jMHv447OwBVhMVq88Ke7TV4FrH2LhR8TgSno2nnBix2SBd7xuWufs0LzyAIv9-52VkbWKuJttsovNuvvepYgceNnDx6niDxKeBhuG1N0P8yceHjm3h7lcCyTGcpJXnDL98t5pVJl4-Q0xOAqJElq",
            ],
        ),
        VibeItem(
            id="vibe-2",
            title="Retro Arcade Tour",
            category="Gaming",
            location="Neon Arcade Sector",
            distance="1.2 mi away",
            imageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuBsdrFyppiCx5T_KNp0lgDIqd_XhVdOYKFq7SW7M9AtPzmB0ZbXq5khzUFCl-j0XTpKV5gyNpbqzXWQJQLPvwncnQWTbUkkRX2kg_gyKHrseHmn-J3jqW6JqxDqtxty223t4_QzTSh_GMHDRBy5SMSbQyiVvxtHa7zuCHd9xVsj9VzllbyBbqUHRuxHjKTkjMLHvBmYUjH-AGsHHI4EDv1fLike88uUuAAyW-zJRlnS4rvDwV8aSpLC",
            tag="Gaming",
            stitchingCount=8,
            avatars=[],
        ),
        VibeItem(
            id="vibe-3",
            title="Midnight Synthwave",
            category="Music",
            location="The Underground Vault",
            distance="1.8 mi away",
            imageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuBRVBwXhNaPM6XNmW52ERzeohdHcojXEVi6DR_5bJSs3FdWuR8E023jZeVpzuKvN1KK_yxgKb7ywA0FBm0d49QTml3JdET4FYI84q3krD9mbZCctLOTSHtFMvN5NbUK-MIBPEcCBoKvZ7jEgKyHjU6AcHUmdrRB-wMWOlC6mv4Dqot9pshf626_muAPaPlKUJRrdfIX8o9rgixkzSn8CaIN_SxPp24p2xV-NI6S0ly7r6eNX16mB39y",
            tag="Music",
            stitchingCount=42,
            avatars=[],
        ),
        VibeItem(
            id="vibe-4",
            title="Rooftop Chill",
            category="Food & Drink",
            location="Skyline Bar",
            distance="2.5 mi away",
            imageUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuAwB44tDq0h8ieH1OmKLh9Ya2yuPEKP2h2YkYFYgou46V1I9ZyXDyLsZY1YqyGN4Ze746xw7jRQx-c-AcjSl9me-Y-MUVCTJSlgwltA7SGeS43h1kA6HB6eEFOMdKkOUPbnCHEkkxSfSD7wwzPu1X78KEqBomoeZo5yydGCtdII7XxuJG_Cglx1pB9zOvDsZqZTd-WdxkHSkn8Clkm84lhphlBqhkEjiC77ydROJAdvUaLXm_rdrpY5",
            tag="Chill",
            stitchingCount=5,
            avatars=[],
        ),
    ]


@app.get("/api/v1/hangouts", response_model=List[HangoutItem])
def get_hangouts():
    return [
        HangoutItem(
            id="hangout-1",
            title="Cyber-Dojo Sparring",
            location="Shinjuku Grid Sector 4",
            timeStatus="Starts in 15m",
            currentCapacity=8,
            maxCapacity=10,
        ),
        HangoutItem(
            id="hangout-2",
            title="Synthwave DJ Set",
            location="The Neon Vault",
            timeStatus="Live Now",
            currentCapacity=45,
            maxCapacity=50,
        ),
    ]


@app.get("/api/v1/profile", response_model=ProfileResponse)
def get_profile():
    return ProfileResponse(
        username="CipherPunk99",
        tagline="Neon District Runner",
        avatarUrl="https://lh3.googleusercontent.com/aida-public/AB6AXuASO9XHc8AfnxC4H-ruM-jzwea5xe6_F_6Ha4uoZZD1Zj0WMH2zpE7C48PmtJYI7LiHyLDR5qG8Oci4llDW_q7ApzoUL0ZTxszL0cUbTQXwukzPKPFFR-JspcMXfG3u7japYa1lGQWskIrG4SMmCAVNSmkG8zdIoGI3w-V1YIGxapdcOihiZXbA4gRY5T3_lKIJD9lHmGI49xhPQXwAHw3G0FD-mniM6d_JMKN5vJoi49IH3MjldTWu",
        level=24,
        currentXp=450,
        maxXp=1000,
        questsCount=128,
        connectionsCount=42,
        badgesCount=15,
        badges=[
            BadgeItem(
                id="b1",
                title="Night Owl",
                subtitle="Active past 2 AM",
                iconName="dark_mode",
                colorHex="#00DBE9",
                isLocked=False,
            ),
            BadgeItem(
                id="b2",
                title="Social Butterfly",
                subtitle="10+ connections",
                iconName="forum",
                colorHex="#D7CA00",
                isLocked=False,
            ),
            BadgeItem(
                id="b3",
                title="Explorer",
                subtitle="Visited 50 zones",
                iconName="location_on",
                colorHex="#00DBE9",
                isLocked=False,
            ),
            BadgeItem(
                id="b4",
                title="Locked",
                subtitle="Reach Level 30",
                iconName="lock",
                colorHex="#849495",
                isLocked=True,
            ),
        ],
        recentIntel=[
            ActivityFeedItem(
                id="act-1",
                title='Completed the "Neon Alley Run" quest.',
                subtitle="2 hours ago • +50 XP",
                iconName="military_tech",
                colorHex="#D7CA00",
            ),
            ActivityFeedItem(
                id="act-2",
                title="Connected with @GlitchWalker.",
                subtitle="5 hours ago",
                iconName="person_add",
                colorHex="#00DBE9",
            ),
        ],
    )
