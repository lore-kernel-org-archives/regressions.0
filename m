Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839452;
	b=u2TqF1TbhGBnJwy03WLB/+VgQqiNxN4q/M/YnEAILJhAzzQ9zHC1RT+0ct01KnsA5+b2
	 P8Wv4jb2vg561H3b7JVPTRGrprFw1XlPGeke4fpqOuVfoWIZ2JeXHUokZynGuv4EykPTJ
	 xxWe7okNvQIs3bkl7/lKCwJ61mKTV9OPqicQDCm9XYV4pBgjBiyefTGupkb0qRio3leJU
	 jQq7CIMVGJ3oDRlhPJwSqSdcBfgsDEQ+f1Dl6bFgQqkvw1HHS+6Cpogie8mek/cLZM0rP
	 YGIdyagdaivrowRRzvxN/OX9bMCjV0/jp8fsAw0CDOJ58WG2Z8qwC0EQid9PaxlR+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HNICyH1Z4rTOKjpfX5U5n8hb8jDB9RXey0UpM4q24ek=;
	b=vwlnaLduwKg+B14h5b1lysK2RQ2yS3ztvzDxedFbE4CHUtl0QbAr3D8UdkJdzqGouqnq
	 he6Pk2/6KtPlXSiePenB8YP8BWHshzxT1Uc9wErKq2P55waFhiZJhhpnAtEwWGTux1mkz
	 zQn1078CkAhDv9L6AkkAp2YmvMT3tEaWN9jBgJF0E81eTFUdl1SJNyW6uaLK76rEqMzOR
	 KLhZ+Nt138ePcwFASGOZRochrjC9uHlJmSkPaRP/DIPmZJrBLM7ZswekiWayCfNNRZgdU
	 bQGr7dBVG249RzSl/dBP5J9j9Pn7U2UXGudHS4Z0Wp1TGo1Qw5al6GdilLC+UP/NBZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sJI0QQGR;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB38B606A31F
	for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 10:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB38B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sJI0QQGR
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so949526a91.0
        for <regressions@lists.linux.dev>; Sat, 24 Oct 2026 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792839451; x=1793444251; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNICyH1Z4rTOKjpfX5U5n8hb8jDB9RXey0UpM4q24ek=;
        b=sJI0QQGR+lYL63QhZKf6bJ09CnB4DHMBx9mD/cLKyMCwM/49+/JcXtHtvKuH5AMnPx
         gSJ32N/fuw2OuPOjeKbUbMd+jpqgmR9HCKSPbOVSwKxIEiVw/mriJu+xocbWEoTH1Vij
         6Ign72vlt0SPIOmUeNTYGaVOVQ+U71t5eraFFPOCDpi8WpcsAn/DFg750pd24p3lDYix
         xX5iaRLcQvkIDfuDxjwRkunQy3I2tO6cJqOBNo9fLKzj5AftHmiQk6ytbB6mRJGg3kMx
         oEM0OOquylIw9ZU5O9LsLf1YInjBOCtw3h2Gy5Nvtuih4ft68Ps2GiVTBz8CrKs//z20
         ajwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792839451; x=1793444251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HNICyH1Z4rTOKjpfX5U5n8hb8jDB9RXey0UpM4q24ek=;
        b=dnnqq5zncelykCjfijlaWDZ8hxFiSurtmumKbb47DEaMGwwqqScVw6cFp4kssSUyJQ
         p2g73ByKkJ73AMNKGliaxGUlqEs6t3ut/15McC3ZrXeHHMSKBmbtUwboQOw3N/KgSohS
         vO5VhDrevaUqx66SzIQsFTXdrcNhGJibsNxgQM1Nbjx0t1Rk0G1gMVMoUxEuxE5a2Tmt
         VwdiTb8Aht4X9vAdoBQfb6UAzteADtkOyTCQLbgMXm6NJTHEDbdNFBdKIwWLJxdCk9er
         zraqPfxyRpBPCR0b981APM2qLZf7OOV3gln6j/dQTJHPYy17yD1kGT8LwnmM1tTvbK9g
         NnAA==
X-Forwarded-Encrypted: i=1; AKwUvBwwYgXcWe23m7Pp6pEo2sO6fQJGAvPDaPO9MmUuoiTxP8Ckf6ODvcUW8Wr+CPUoiR5gUOuggTrUEQV/1Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYK4fdnpsg+6VDtue7+7K+1drkeWjPFefuInnuR8KdCttHDy+/zc
	acAMdfQh3dMT6Ob2iNyOUnHupMoZgwwczaG8ymvRbx+HpZSCcnWmnNbT
X-Gm-Gg: AYBFou211BzPKeQEjquuAmMkq/8V4ZpEv1KmbonoeYXDCks/f5ZcT1N4ZeuFSfv5Lo0
	/K88hXsOONtpLrTzPBUfaVLJchivmdMx/eCYsEJYG7hCTu3uF4Zku81u6br4fubtujq/Gs8P3PP
	TU7LQoB5QKYdoUfbmCRQG68qaaP7NKdbnjEbyNYDG+HYmB9yEDdmZda0eukXygEyKDLLDLMGM4U
	wHiV5WqxTobRKMAti9zanUQf55KVHgZqL7VI8gApy09C/HQ7+M5zQLGVgHbl/fCUn6CvDBxGg9F
	iex5aVMzsEc5Nccw4tbiDPuSqu1oQhoddcDYgcyoBKXgEoPBsR+3hgTHpMO1prujanmj9HIZl9u
	VhttuQtVsoKbcYYrRrte24mYDzq3XvE1WZbFVi9URg8XViPbaeILP5uq+bDJEQP4cBCTOYFIiUn
	l/alUnfzMhxkd+NogqSEhPBjQ+tsHAOoetu+ux/IWzVZ+E+YJrb2UTlAAH9qQv7ebf6zTeAiJoo
	kl7NqdCIiSBitFE8vJFG5H3lZRPfNySECxwzKOoY/1wNsC/3VHkOykL8aOsmqPDLpDMAqMc+nCB
	1/7Ro3yDm6t5RnSOGLwQQQUhTMN3QPIunGgA/OKkvs89CvBZvBGyZZzfcbpW9xvYIUnEy1B+Ao5
	BROzjbQuhGYMYQaVCzqQDRvV2SXEn+sOzI9ym9A4Swe0TMyN0f5RSO3FLA4klOY/qi5sm7dGp2m
	qoh4xgVOU67y8r+LWN03WiS6XCTCkpcTaQMjKCWaBa3yENVbhh+0wmAab1
X-Received: by 2002:a17:90b:2e03:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3adeb64b96cmr940283a91.33.1792839450816;
        Sat, 24 Oct 2026 03:57:30 -0700 (PDT)
Received: from desktophank.localdomain (111-242-220-176.dynamic-ip.hinet.net. [111.242.220.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6946dsm2565666a91.4.2026.10.24.03.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:57:30 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: stable@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Frederic MARIE-JOSEPH <fredericmariejoseph@protonmail.com>,
	Wolfgang Walter <linux@stwm.de>,
	Bob Anderson <kernel@ametros.net>,
	Domenico Suppa <domenicosuppa@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-acpi@vger.kernel.org,
	regressions@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH 6.18.y 3/3] ACPI: scan: Do not combine resources that overlap completely
Date: Sat, 24 Oct 2026 18:57:10 +0800
Message-ID: <20261024105710.593-4-ue081723@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024105710.593-1-ue081723@gmail.com>
References: <2026102308-twisting-bazooka-12b5@gregkh>
 <20261024105710.593-1-ue081723@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

[ Upstream commit 7617cc05df28dcae967cca109de74084321eaa62 ]

Commit f234fdaae1ca ("ACPI: scan: Avoid registering platform devices
with resource overlaps") attempted to avoid platform device registration
errors due to overlaps of resources of the same type returned by the
same _CRS object in the ACPI tables.  It did that by combining two or
more overlapping resources into one, but it went too far and also
caused resources that overlap completely to be combined which broke
the arm-cmn driver that expects two MMIO resources to be present for
each device it binds to and it expects those two resources to overlap
completely.

Address this issue by adding checks for completely overlapping
resources to acpi_platform_adjust_resources() and add a comment
explaining what is done there.

Fixes: f234fdaae1ca ("ACPI: scan: Avoid registering platform devices with resource overlaps")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/linux-acpi/20260819003752.GA3063251@ax162/
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Link: https://patch.msgid.link/12955564.O9o76ZdvQC@rafael.j.wysocki
[ Ting-Han: __resource_contains_unbound() was added by edfaa81d5da5
  ("resource: Add __resource_contains_unbound() for internal contains
  checks"), which is not in 6.18.y, so use resource_contains() instead.
  The two only differ in the IORESOURCE_UNSET check, and the resources
  returned by acpi_dev_get_resources() never have IORESOURCE_UNSET set:
  it is only set together with IORESOURCE_DISABLED, and disabled
  resources are not added to the list. ]
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
 drivers/acpi/acpi_platform.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_platform.c b/drivers/acpi/acpi_platform.c
index abdd8893e..29b197440 100644
--- a/drivers/acpi/acpi_platform.c
+++ b/drivers/acpi/acpi_platform.c
@@ -85,7 +85,13 @@ static unsigned int acpi_platform_adjust_resources(struct acpi_device *adev,
 	for (i = 0; i < count; ) {
 		struct resource *res = &resources[i];
 
-		if (resource_type(new_res) != resource_type(res) ||
+		/*
+		 * Look for overlaps of resources of the same type that would
+		 * cause resource insertion to fail down the road.
+		 */
+		if (resource_contains(res, new_res) ||
+		    resource_contains(new_res, res) ||
+		    resource_type(new_res) != resource_type(res) ||
 		    !resource_union(new_res, res, new_res)) {
 			i++;
 			continue;
-- 
2.53.0

