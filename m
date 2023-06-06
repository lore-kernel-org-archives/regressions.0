Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173671ED33
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 17:11:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp [126.253.223.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6AD2AB;
	Tue,  6 Jun 2023 19:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1686071487;
	bh=5WdBlgFvektNVo4NS0O1kr6BNHu+cnRD2Z3+c7jj5j0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wFuiQUGpXXyZHZyw4o62MXekvbyLGH+fHVy9Xlm3o1DrVpZnv2ofupUFpKVJJWgSS
	 YPh9PqGyjPXVp7tyhMqGtqpqcTab1wK+cPSGm3Ik7M0wGUUy2bxiRnyCFs8nALBq2q
	 56dLgF1bWQuvBfIGsB4/9Ub/x4JGe4MF7WUp/ukc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Poncho <poncho@spahan.ch>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	regressions@lists.linux.dev
Subject: [PATCH] media: uvcvideo: Fix menu count handling for userspace XU mappings
Date: Tue,  6 Jun 2023 20:11:50 +0300
Message-Id: <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230606170919.GJ25679@pendragon.ideasonboard.com>
References: <20230606170919.GJ25679@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When commit 716c330433e3 ("media: uvcvideo: Use standard names for
menus") reworked the handling of menu controls, it inadvertently
replaced a GENMASK(n - 1, 0) with a BIT_MASK(n). The latter isn't
equivalent to the former, which broke adding XU mappings from userspace.
Fix it.

Reported-by: Poncho <poncho@spahan.ch>
Link: https://lore.kernel.org/linux-media/468a36ec-c3ac-cb47-e12f-5906239ae3cd@spahan.ch/
Fixes: 716c330433e3 ("media: uvcvideo: Use standard names for menus")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This is untested. Poncho, would you be able to test this patch to see if
it fixes your issue ?
---
 drivers/media/usb/uvc/uvc_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 5ac2a424b13d..f4988f03640a 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -45,7 +45,7 @@ static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
 	map->menu_names = NULL;
 	map->menu_mapping = NULL;
 
-	map->menu_mask = BIT_MASK(xmap->menu_count);
+	map->menu_mask = GENMASK(xmap->menu_count - 1, 0);
 
 	size = xmap->menu_count * sizeof(*map->menu_mapping);
 	map->menu_mapping = kzalloc(size, GFP_KERNEL);
-- 
Regards,

Laurent Pinchart

