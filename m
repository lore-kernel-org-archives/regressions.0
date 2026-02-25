Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DC227B35F
	for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772053146; cv=none; b=AqTb6JP//m5aMSXIEz0PxRu0QNu/pIUnrdLZiB59VAjLGmWmQSjBA6OWjcVmQ11bX/WB8ZLS9NTCE34UUkooZQ7CBQiFgjsmWNJgEEG3fR/F67KbAWs7YggvqahEaZdub8LgN4knNizurGQH29953Oy/J6pfFHnWYprLEsi1STg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772053146; c=relaxed/simple;
	bh=vVUewmCetlatWHv1R0K4yDCftZPESVw6eXHO6Nn7fJA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=hRVBRddmitTYH3MiEXOnL2sp0Zv2Q3XkJDekbggLnwWO6c6DPA/3AVpRiYCxGo9FW8mmOhX+yo0CIEMR08tpsRDrFhF9vn5uNnERQUz+uvgpgW9nVDquDWk0EC69lPPmO0+p3OFbuHu1qYZRkEtqHjmUKwp+cKappEXmho+GiiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=DlmtaA0+; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="DlmtaA0+"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1271195d2a7so366907c88.0
        for <regressions@lists.linux.dev>; Wed, 25 Feb 2026 12:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1772053144; x=1772657944; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBD+gcuj5ZDr1GM2fX0wE6cy1EESApbULJSp5txJVcs=;
        b=DlmtaA0+5WpGJkh+a4/vEObD7syRbw+2ee4E1HNggKJZunEB+MRL1K//M1hfpMEoJo
         P+vU5/azLxGtkPsv9AEMWKwOUfRmyW1s03uRi20/fU7cFwwhFMjsarnwNCy3jBtfDGFS
         YgGq8VhijN5svwVb4frjrgQVTofJikJmOydemak4b3cHoxBGhjPw+9RH0fzaeKV4s1UK
         UAyHxkyyi0v8RoqoaiH2fuUtvHTN69CkGvlVjvw8w/9rUv98lXoRh3lYVCiElL+WKbee
         DFo1jWB/iIj+7sY62mpHdydClp2WJd6UsmobvYj9iDAl1R+T+bveu7ii8KcPbm+rBzeG
         4Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772053144; x=1772657944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBD+gcuj5ZDr1GM2fX0wE6cy1EESApbULJSp5txJVcs=;
        b=ZpNSQqnm/mZUQGl1JEShW/QVgVl9HxjSTeCN9fC58IvufIQQrnOwueGsWnPf49rHLB
         hJ1Zd4VqBqZ53YN8ss075M1X99m6S2wnA8gLmGFV1V4ffERuwiuPc5MP6vRrQIMOKZB1
         Fz+jKBHCg6dWyM+FExoPJD90yp/7PetOxn1b2y6WNAsh7AHQTDfkLYLCf6RJNuPvEl17
         9VyLB5HZtlAzrpfXNQAMhx5ypPpCSAJpcfLva22nBJSUDpriECAabGEwE7G2jxv0qFeH
         oYJzotIWWO/9+D+mxt32xtEETzT6C7+Q7ROwBdtakH7sZtUQhISyxoNdmiDcNywoRDSF
         piFw==
X-Gm-Message-State: AOJu0YzwIxTM+1B7HW82H/p8dGOPcfltgV3hhRZIuNKrp2Xm6o6ABX1X
	3H1bgtsUDijFDAtejWtjPr+cG1hsuz18sLhLgxl4YUUJSI+5oYZrt0pqOOmWINA6Drs=
X-Gm-Gg: ATEYQzxnS30EjUpM3MJikNDZwod/OdEQCG8XvWX8qIYhhJzdkKvSGJZN9a+4VRwJCY/
	FpW4sMOwfOi+SAWc1EqKApyEYmvV0ixly/TXqlR+q73JzzEkTPjiweF1O62u84dE6gRIikroeFy
	60rYCOnTPRu3Ph4FtYO2Ao4pClGXc7nyykcn53XLUT6Ni8kLJPAff45AtLv2mop6MhrCmSy2hOr
	f7KkLDKc1CMtl4l2VYrPAS/9YlPoxNzmafQfBenZwHFszF7pmIlk+4Thit76PPtlue1ng+mgqU4
	PvSmaSUlFeuLfsbd1ei8FnAFfVbnxbm1O0LbPC+dL0/E6e4oWOtWNGymUpnn87eoo2hbYo3KMLw
	JvtbJeJZIGE9wDqj5+VTC9SgmA3ZbIwH3NXUrGfhkip6b2VpJ9An9zJCIGPaaA83VvQek/PmxBR
	oC1qJBGVwTjk4oMGle
X-Received: by 2002:a05:7022:68a4:b0:11b:9386:a3c3 with SMTP id a92af1059eb24-127869c0da7mr1006898c88.46.1772053144055;
        Wed, 25 Feb 2026 12:59:04 -0800 (PST)
Received: from d14e337afe00 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899d49ccsm16161c88.3.2026.02.25.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) undefined reference to
 `__udivmoddi4' in
 vmlinux.unstripped (drive...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 25 Feb 2026 20:59:03 -0000
Message-ID: <177205314269.2960.1720626770087948602@d14e337afe00>





Hello,

New build issue found on next/master:

---
 undefined reference to `__udivmoddi4' in vmlinux.unstripped (drivers/gpu/drm/amd/ras/rascore/ras_core.c) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:dc8172b1090ab934a0e5bf70ede907ed6caaba80
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  877552aa875839314afad7154b5a561889e87ea9
- tags: next-20260225

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
ld: drivers/gpu/drm/amd/ras/rascore/ras_core.o: in function `ras_core_convert_timestamp_to_time':
ras_core.c:(.text+0x273): undefined reference to `__udivmoddi4'

=====================================================


# Builds where the incident occurred:

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-kcidebug-699f38921f24bb69463aa0f4/.config
- dashboard: https://d.kernelci.org/build/maestro:699f38921f24bb69463aa0f4


#kernelci issue maestro:dc8172b1090ab934a0e5bf70ede907ed6caaba80

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
