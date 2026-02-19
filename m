Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614F228469B
	for <regressions@lists.linux.dev>; Thu, 19 Feb 2026 22:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540396; cv=pass; b=uQe9f7tLoFlqc8Yg9ZJZ63t5As2NtwKjtz4F2G0c0lH4pytdtsSHDHTvgJGNL+JEmMK/XU1hOhiJc3M4UswwYH5xESGKAOTJk7qIf766R6m8pm2Llq76VhyFJ4H/VkmJLj7zCfFp//PDkiZImCzr2xuZL3Zxn64uxk1l0Ew7Nn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540396; c=relaxed/simple;
	bh=0c86jRAYAOOniszwr225rxzBQAZQQwvb90WTwPNyTgs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uv2uLcu0/nkU8froaATRUvqtrV6UHQOa4cgV5ybcbFAAJvOZcXTPY0nK2acDsMiUhaJaSrWIqcp1uJySc/qRHlJk+4V9H5/5rfmdQ8jxjE3VYdezQciz+vkQDN33dLLqxrPDyyTsn4rpAcO5AJjtVjyjuWVIHr2ExEBinCcaWRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heEcAXRM; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heEcAXRM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso1642834e87.0
        for <regressions@lists.linux.dev>; Thu, 19 Feb 2026 14:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771540393; cv=none;
        d=google.com; s=arc-20240605;
        b=JKj3AGeAT7s+zC4zw6DVv5LSl/KAufZcnrBYFYrcO43T6wC4eYXm1oHedyHV5T3FbL
         kvZl9rOmnX7dwWTyMdr7wfjhx7zePCNhDBl5RrQPEDFcZ4Ddgym/NVnEO3xXN0gBEJ45
         9QELGL5K6pIUqpGjNHQQMjtSlC0I+QioSXacnywW/E4LxdaxrGZE3VmxNPdifBo/yVvV
         7/SRgUddlaNHF97lJWKQTf49BrbebDBhD2bvs8nHSJ37GA+yQT7ufyX17CFKRUXzd5cB
         SzjcFxw6YYVtdxCLEtarg54ukgMBqmeaR9VvbMdTkOwZTMaGN06XKer6ncu4u6JeZ6Dd
         yPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0c86jRAYAOOniszwr225rxzBQAZQQwvb90WTwPNyTgs=;
        fh=lxkoBtBdbcxhsjSrwTlGSdZ6UOhnEpP4AAr/c8lgK64=;
        b=SG5kKoB8+aDHRD+IxOAuckaKPq8gskEurTPjiQ7gaHGwUyEl4maARN9700KtFRuRAj
         TG3jpvUpFkEdojJK641VbeKqdwJoOS+Y/DKqOrgqFrnf3TZKE8uMIfjBvYc2KkBmrkm+
         UhcHil6iqAGEU7NdBLMCf3oJcrKMVkS812WfuuT6Mw2DypuVCYJFV8L+zf882jecp950
         QAopyKX1ZZX+b2qlMvOaP97U+BYC+PKEKcTfpnrkPFCrolRaOyzKLffpWPcfr9VPVbcO
         gjG4lSJqBSoD1C6rkL+NQLqyA0MNnjV7oHLg85SlPye5ROnCTkYjya2MacoLaukOShzB
         fPUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771540393; x=1772145193; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0c86jRAYAOOniszwr225rxzBQAZQQwvb90WTwPNyTgs=;
        b=heEcAXRMOz5sd/y7mkTkbrxvGAk9PA6dzqDFYjj6kz4qwLD55TO5H0O8uSZt9xO1mp
         KMGztJ45z+QWBNYg+P+hygiq6jg0ti12WEM10a2EUQr1N0CjxauyAP5+rp+FyClhEXV1
         oOmgDy1//BEFWwiueoRJXUpnGboVqu5wG6GMCDUjZmOZYMfv+g8tm7MT8HTwOTXWIvUX
         tfvY6xtSnCLalot8pqUe653Mh9n5J/4NpJNIBDMu1kw2bzJfiPAF4s1fWQU1IWZAW0am
         eguGG3xw92s3B6JlSIlGZswJS4hBoVcFgbwGWOxMY0VHtFwqdUSRXt7m+HknOXa7k8Dh
         /yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771540393; x=1772145193;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0c86jRAYAOOniszwr225rxzBQAZQQwvb90WTwPNyTgs=;
        b=BQYTljK01ywfzMuArmeIrqZgDXKkILsejL0IvOavBN3D0XBkfqj6IZLyzbbVLxFMTZ
         gVypull6IheMwLZADpQApt9LyELpMnBRiX5TMP40CL0HrxBG21k07WOpxKEm1iXc4qay
         KGICORGQDySlndVcjC2kbYp8G3bz+lCvUIKCrgLp5r2Tw8vVXf/bW7YUAQ2g2DRIfPYU
         NBO7C6cWTe0j5QwtzKaHc+pl60zAgfS+uVHqd3Fk1ez/dPOYoAbXjJ8t3JLQhwCD7PAt
         EllnU2DIxVy50GvdtsTb3bpG1OpKdpW7w+llI7nagtQCQ+AltCTLZ78QZRkj2OQFuyj3
         Jreg==
X-Forwarded-Encrypted: i=1; AJvYcCXRT1yCw25/q0Fgu9JcQAFUek03DsHyXHY5Dg6+DpnkgKhNBFRjbE98C1vjIlonElchiQniyedI33tj1g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6F0D5akwTYHZvl+Q4UxE+CfNTb4qRBlHIf9hGQ9KIYE0WSRLk
	OOxlWB7Uy2bCZhuZrWFTx6HrlJ8ne8rxhctl0D9nIxLcRRriScF2zkcuE9uvPHcsPvqTYzdPszM
	nhlRmeUCCj03OQrlWv3bo3HY5u32R2A==
X-Gm-Gg: AZuq6aLfhGYkWQ6itvmaWV76mWM2Fw9xz+ReVLrn6W2BT/N5OGgOUiJs8P4H6hPZONF
	5OxjIeq59rXfBvufw5J/vtIf91hsoLyzvWL6gKLFkk3YWT2ya8KbI82lfidW2UeSq7OFc7k41hO
	gGibF+OGJFH/ORlfQJ/UyON88cQ8MIXmVd+5soxabTEdzr9HEBFxuJ3Qks/SPe57ZLytpoqNP/r
	o9WUPnWokhGJ/bNdmaiUjxB7VJXXzZNYLcpC0lLdVJpj2DMcYbBCKXdnCPwUffZ50cfVghH1YpE
	tJu/CUkYhJxEms9lsQ==
X-Received: by 2002:a05:6512:23a4:b0:59d:f47c:100d with SMTP id
 2adb3069b0e04-59f83bbad74mr2430338e87.24.1771540393099; Thu, 19 Feb 2026
 14:33:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: John The Cooling Fan <ivan8215145640@gmail.com>
Date: Fri, 20 Feb 2026 01:33:01 +0300
X-Gm-Features: AaiRm51jvRuCF3Uzbemg_3Ogc0GaotIPeGjtPgaNcd2hy_qmzlM99LaySlt9CPA
Message-ID: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
Subject: [REGRESSION] VRR not detected on a DisplayPort monitor using an AMD GPU
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, regressions@lists.linux.dev, 
	mwen@igalia.com, mario.limonciello@amd.com, alex.hung@amd.com, 
	daniel.wheeler@amd.com, rodrigo.siqueira@amd.com, alexander.deucher@amd.com, 
	harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com, 
	huangalex409@gmail.com
Content-Type: multipart/mixed; boundary="000000000000d620f9064b34e329"

--000000000000d620f9064b34e329
Content-Type: text/plain; charset="UTF-8"

Noticed a regression with VRR after updating the kernel. My main
monitor's VRR stopped being recognized, I was no longer able to enable
it in my desktop environment settings and
/sys/kernel/debug/dri/0/DP-1/vrr_range showed a range of 0 to 0. I did
a bisect on the linux kernel git tree, and found that the commit
introducing this issue is 0159f88a99c9f5722dbe52ac42faf3446f371dea.

The monitor is connected via DisplayPort, no converters as far as I
know. The GPU in use is AMD Radeon RX 6700XT. There is another
monitor, connected over HDMI and it has VRR working in all the
versions I've tested. Attached the DisplayPort monitor's edid copied
from sysfs.

#regzbot introduced: 0159f88a99c9f5722dbe52ac42faf3446f371dea

--000000000000d620f9064b34e329
Content-Type: application/octet-stream; name="main-edid.bin"
Content-Disposition: attachment; filename="main-edid.bin"
Content-Transfer-Encoding: base64
Content-ID: <f_mlu0pn6z0>
X-Attachment-Id: f_mlu0pn6z0

AP///////wBNZxMnAAAAABkhAQS1PCF4Ol3QqFNHqyEFUFSvzwBxT4GAgQCBwKnAlQCzAAEBal4A
oKCgKVAwIDUAYVwhAAAaAAAA/QAwS9/fKAEKICAgICAgAAAA/wAwMDAwMDAwMDAwMDAKAAAA/ABE
RVhQIERRMjdOMgogAXcCAzTxSwECAwQEDhMAABAAIwmHB4MBAABlAwwAEABtGgAAAgEwSwAAAAAA
AGfYXcQBeMAAAjqAGHE4LUBYLEUAYVwhAAAaNnYAoKCgKVAwIDoAuoghAAAeg0iAGHE4LUBYLEUA
DyghAAB/AAAAAAAAAAAAAAAAAAAAAAAAAAAAGA==
--000000000000d620f9064b34e329--
