Received: from smtp.livemail.co.uk (smtp-out-60.livemail.co.uk [213.171.216.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436DE31A8E
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=5harts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=5harts.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from laptop (host-78-146-56-151.as13285.net [78.146.56.151])
	(Authenticated sender: malcolm@5harts.com)
	by smtp.livemail.co.uk (Postfix) with ESMTPSA id C6E1BC5A22;
	Mon, 27 Nov 2023 15:23:30 +0000 (GMT)
References: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
 <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk>
User-agent: mu4e 1.8.15; emacs 29.1
From: Malcolm Hart <malcolm@5harts.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sven Frotscher <sven.frotscher@gmail.com>, git@augustwikerfors.se,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
Date: Mon, 27 Nov 2023 15:23:08 +0000
In-reply-to: <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk>
Message-ID: <87leajgqz1.fsf@5harts.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


From da1e023a39987c1bc2d5b27ecf659d61d9a4724c Mon Sep 17 00:00:00 2001
From: foolishhart <62256078+foolishhart@users.noreply.github.com>
Date: Mon, 27 Nov 2023 11:51:04 +0000
Subject: [PATCH] Update acp6x-mach.c

Added 	ASUSTeK COMPUTER INC  "E1504FA" to quirks file to enable microphone array on ASUS Vivobook GO 15.
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 15a864dcd7bd3a..3babb17a56bb55 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -283,6 +283,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "E1504FA"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {





Mark Brown <broonie@kernel.org> writes:

> [[PGP Signed Part:Undecided]]
> On Mon, Nov 27, 2023 at 12:24:59PM +0000, Malcolm Hart wrote:
>> Like other ASUS models the Asus Vivobook E1504FA requires an entry in
>> the quirk list to enable the internal microphone.
>> 
>> Showing
>> with 7 additions and 0 deletions.
>> 7 changes: 7 additions & 0 deletions 7
>> sound/soc/amd/yc/acp6x-mach.c
>> @@ -283,6 +283,13 @@ static const struct dmi_system_id
>> yc_acp_quirk_table[] = {
>
> The patch appears to have been unusably corrupted by your e-mail
> software and is also missing a Signed-off-by.  See email-cleints.rst for
> some suggestions on configuring things, or it might be worth looking
> into b4 and it's web submission endpoint:
>
>    https://b4.docs.kernel.org/en/latest/
>
> [[End of PGP Signed Part]]

