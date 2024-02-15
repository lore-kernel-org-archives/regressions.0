Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CA253369
	for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708012813; cv=none; b=SpesOJTAFDdSIb2A7YarE1MGWro2S5OtZafSPbhz5aHPaOFNxhsxXZUrs96FRY/SUNF0tDjbkvLsBmXgu4Eyh6viv0VKeM7LDPdJIsIB1d+hUONyM2fU3ORKGaCjjm3kngPs7dXI5IwlLOlXG7sw43PTUNW5gss8T0PH7l/xKI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708012813; c=relaxed/simple;
	bh=efI7EHUWyJpw9Gi9WGbXXvUfsFilS5UqiJK0pzRwJgA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Qg2o2XG2/0HTJwop9k0Qt6gudye41QU90sQ8cPJy/W6Sd9HlxGVi0MFKY4fe3lbu+Nt29Fnf6EtOwrSdZS0IeZS1q/tL/seYhIfYX8XpG/GagpJy9c1lx39ZWbll5GtPm5s8tox9pF1pm2+PNmWeyLarQ+kgLKqskBx6klFUhJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+jFlxJ/; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+jFlxJ/"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc74435c428so896863276.2
        for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 08:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708012811; x=1708617611; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WBfIQ5c2kGyikGze5eL8WFjT+JDTVayrtF6yiNuBoDE=;
        b=O+jFlxJ/Si54eV6wju9oFYgj8Wn+Cmis5/daRKESbBgWqxbBg4u4iBedRGONlT2mbf
         ZcbIWa1bPftLjkoVTqKh/l6XeEzaDegaSD7PYeYgcoFfu81rlq6I2uaVLxnruYmfFMVc
         SzmEIaLvE8xP3XQxIWNNfS3qJCxWo+t8jrusIDBQXoJEAOfdcvZrQzxJkgIGwZCt1Zs0
         Ky9A+ZS7DtPJCtiQISXlfa03oDYTJ3CphHAt6z/CPNqYZBJuiDkhSKZ+9p0Opl0xSmkb
         35GG8f3Cl5fv8AwjE558RCMckvvahKvhSkGaTkgimAJEMLepX7hi+IgRFujNflXkSLEQ
         sH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708012811; x=1708617611;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBfIQ5c2kGyikGze5eL8WFjT+JDTVayrtF6yiNuBoDE=;
        b=u9w45j8+8rQytNqgoM3B/OTcTj+Osy4vw5ltf4VSa+uk6ti+9qmUqo3oBD6jfYfu8w
         6ca9hPpJk66bOk2zVJL/5d9uIFOSg4TMZnNcOYVXhCLjn2HqEBDiHPH+oAuMKwkkQphz
         F59eAJpbbOi/utSt3i77K8a60HsrUaUqe5yW/9Giq2+Zlpgp+2sdaPWC0TV6IhltBtnf
         jEBR3vNBlNZPRvnlNV6/ufP61cWFnjAsGvChi0+k5LdpSlcbSHxE8SFzwMPmQ5mzBxDD
         EDv2tdNJgdasxxHFTs6Ut4yYVNIlDvwj2L8NRtuYKBtqPLOpW5CeX7yQKuLAEWafuOrN
         guSg==
X-Gm-Message-State: AOJu0YxOrZJWEt+XbinwT8Hkdy2fQkGuA5Qx5cbU9HV/LSKjKNSNK4Ld
	QH9Pzz79tWem/Jwg0CooFSCaLQHrgb+Sm3GXppEuvRt18qpRxzUUTtl7jvqBxVqZX5GDn4GqIT+
	+oonq2jN1UiyRBChIgZl1MAim7Ec=
X-Google-Smtp-Source: AGHT+IEC7Yr2xkVFfFo2EkfVLZ3HtG6ag/dgxB5SUrBFGcbmGbfPaqyH5GtGlX64LalJLOiXH4r2CqPQ56qLoQpRQvo=
X-Received: by 2002:a25:b904:0:b0:dc7:8c3a:4e42 with SMTP id
 x4-20020a25b904000000b00dc78c3a4e42mr1780417ybj.30.1708012810912; Thu, 15 Feb
 2024 08:00:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
Date: Thu, 15 Feb 2024 16:59:59 +0100
Message-ID: <CAN9vWDLbM3tiBQRz0rNxfrLP4bMrEOiTNLRd4avvYKiEcpUr4g@mail.gmail.com>
Subject: 7840U amdgpu MMVM_L2_PROTECTION_FAULT_STATUS
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>
Content-Type: text/plain; charset="UTF-8"

I have a Framework 13 with a 7840U and started having massive GPU
driver issues a few weeks ago (including system freezes).
Unfortunately the information of when exactly this started to happen
is gone, but It should be somewhere in between 6.6.0 and 6.7.4.
I got many different and random dmesg-errors and system behaviors, but
I currently can only reproduce one, so let's focus on that for now.

First some basic info:
I'm on Arch Linux using the `linux` kernel package.(currently at 6.7.4).
I have an external monitor connected via a thinkpad thunderbolt 4 dock.
I am using amdgpu.sg_display=0 and VRAM sharing is configured to
UMA_GAME_OPTIMIZED in the firmware settings.

If I start playing a youtube video in firefox with hardware
acceleration enabled, it stutters until it stops playing after a few
seconds. I can see this in the kernel log. I see this multiple times
for many different addresses.
[ 5641.070540] amdgpu 0000:c1:00.0: amdgpu: [mmhub] page fault
(src_id:0 ring:40 vmid:1 pasid:32786, for process RDD Process pid 3680
thread firefox-bi:cs0 pid 3852)
[ 5641.070549] amdgpu 0000:c1:00.0: amdgpu:   in page starting at
address 0x0000000000020000 from client 18
[ 5641.070553] amdgpu 0000:c1:00.0: amdgpu:
MMVM_L2_PROTECTION_FAULT_STATUS:0x00143A51
[ 5641.070556] amdgpu 0000:c1:00.0: amdgpu:      Faulty UTCL2 client
ID: unknown (0x1d)
[ 5641.070559] amdgpu 0000:c1:00.0: amdgpu:      MORE_FAULTS: 0x1
[ 5641.070561] amdgpu 0000:c1:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 5641.070563] amdgpu 0000:c1:00.0: amdgpu:      PERMISSION_FAULTS: 0x5
[ 5641.070565] amdgpu 0000:c1:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 5641.070567] amdgpu 0000:c1:00.0: amdgpu:      RW: 0x1

Thanks
Michael
