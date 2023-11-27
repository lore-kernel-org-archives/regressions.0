Received: from deferred-out-02.cmp.livemail.co.uk (deferred-out-02.cmp.livemail.co.uk [213.171.216.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C028DC8
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=5harts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=5harts.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (unknown [127.0.0.1])
	by deferred-out-02.cmp.livemail.co.uk (Postfix) with ESMTP id 34662D0C5D
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 12:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at deferred-out-02.cmp.livemail.co.uk
Received: from deferred-out-02.cmp.livemail.co.uk ([127.0.0.1])
	by localhost (deferred-out-02.cmp.livemail.co.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvn_Y6EL6eHo for <regressions@lists.linux.dev>;
	Mon, 27 Nov 2023 12:25:09 +0000 (GMT)
Received: from smtp.livemail.co.uk (smtp-auth-out-04.cmp.livemail.co.uk [10.44.166.53])
	by deferred-out-02.cmp.livemail.co.uk (Postfix) with ESMTP id CC2A7D0C59
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 12:25:09 +0000 (GMT)
Received: from laptop.lan (host-78-146-56-151.as13285.net [78.146.56.151])
	(Authenticated sender: malcolm@5harts.com)
	by smtp.livemail.co.uk (Postfix) with ESMTPSA id EE7DBC5A53;
	Mon, 27 Nov 2023 12:24:59 +0000 (GMT)
Message-ID: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
Subject: ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
From: Malcolm Hart <malcolm@5harts.com>
To: broonie@kernel.org
Cc: Sven Frotscher <sven.frotscher@gmail.com>, git@augustwikerfors.se, 
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,  mario.limonciello@amd.com,
 regressions@lists.linux.dev, Sven Frotscher <sven.frotscher@gmail.com>,
 stable@vger.kernel.org
Date: Mon, 27 Nov 2023 12:24:59 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Like other ASUS models the Asus Vivobook E1504FA requires an entry in
the quirk list to enable the internal microphone.

Showing
with 7 additions and 0 deletions.
7 changes: 7 additions & 0 deletions 7
sound/soc/amd/yc/acp6x-mach.c
@@ -283,6 +283,13 @@ static const struct dmi_system_id
yc_acp_quirk_table[] =3D {
			DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
		}
	},
	{
		.driver_data =3D &acp6x_card,
		.matches =3D {
			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER
INC."),
			DMI_MATCH(DMI_PRODUCT_NAME, "E1504FA"),
		}
	},
	{



I have this laptop and I have tested this patch successfully.

Malcolm
