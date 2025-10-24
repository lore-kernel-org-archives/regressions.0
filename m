Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981F016F0FE
	for <regressions@lists.linux.dev>; Fri, 24 Oct 2025 18:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761331627; cv=none; b=eVlr2sCAovzSBh/TGg2VgHaMgXssmaJBFYarexxv0/+8r3V9rOHAmURETVQvNYna4CXGmhv+l1HQK3RgrbVnUBOYhGUaotoeQwpoXDFIalQTARnh/GxO8eTPdWpTee1qP9gNrZD2q95lZhR8dI46N8xHZr+ji15jbFE/0xcS8KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761331627; c=relaxed/simple;
	bh=R8fNNRRdddoxUOwDfGtRzFmHhHAN8ffDJkIMnmYnMdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q/82zM3T06wmQXDH+GhFIEvPbvjeiMioJ8T26EHwP7BhpGgXJJsGZ3ixDrqc4TH0aE51wfrXxpglTkIXjaJjsZ578+I4oiqYrVhbTgtvUM8BnKJOkloyIdBj3641e3C4UjkgemKdxzy1pKXFNciSX+mmbt513aE57yekgYC6AVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPvLx9S2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPvLx9S2"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-378d50e1c77so22477871fa.0
        for <regressions@lists.linux.dev>; Fri, 24 Oct 2025 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761331624; x=1761936424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oD3ego+Ol77xdVDJDDd2idHjYgj2xd6f5ByWrjnuHRA=;
        b=CPvLx9S2E1Apygu+u09JcQm2v7eP4MFwX85l5R4nf3zpjjdTwfUA8QGr+yuu8FgHoQ
         maJSNzpLsFzLnk7zaT9dXQ/24fMKBFrxK5RlJwFdmtZcfsViTz6U+QetjI5hPYB6fVXA
         F1MShR9zwnWVgM8tu3GnWvditmmdKWOv5Dg3bIztb7s6FMKE4vJRwlTmgi4WOupZGBz9
         ih/QqGM6GaOOBUpyDm1nv2Wsbs0jaj4lyJFaHikJb2CmQYSkgTj9uMzRwRjYyK1dX6UG
         Zzvo2lsMtNflpCLH8eilektnGnq3u8P7sJZo+CmuX7eOMzvdei0CR4lJWrq2bfSGKLg+
         o0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761331624; x=1761936424;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oD3ego+Ol77xdVDJDDd2idHjYgj2xd6f5ByWrjnuHRA=;
        b=Wh455XrXpbGlR+Vl3bZ9y0CvVEEIcUpRsACI22Yc8mQoXXWano/U+BtTLVLNhbva5t
         tisb2EjO1JcFhPP7DhssCvlW73K0KIE+EIJKCzwDjWEez062QPWQEgfCvs4bg0ZTfTdt
         HS8kqj4MoH4Yi5//Aoh+sh2Xb7s9WIjTb767LU51UblrwMm9PN3FGQMvmJuR+YpB3T2Q
         UHv+aPb7bxyiLP5ciOpoImvp65M7OjP6o1cvD/E5VXoaHaMiK1BgcArG4m6OzaajrqRc
         U8soAsGDx12mckYMaLQLyLJbeoc9+0lEcM20wc1m75kF5dxFGHuPuwjXpO7H5vxwHRG/
         YBqA==
X-Gm-Message-State: AOJu0Yw3TwqvhcD/8JyImwR5LzsV4K5IiHqu6K0VE3g+GbmMQneZEfwJ
	R85FePQwjneZvsuQaMvMDZuXFv9JFIIgGW0eQsaLIMZASuhxndCB/Noz
X-Gm-Gg: ASbGncs7Bskj/swYmYndUCBw0L6dw3IPQ4jZn9MToyK9OFkBX9odOGBlqkLfTzmtDGj
	hZ/0uyAHUP5VRYpJAlGTh8/o6usqVQeUSAqhhl4Fy1m2WAxJ+5k0Ba1Y9G0gqjbaV4rGdlkHfP8
	yVg2gZBDGwhO64Uj0q+fN1vLpsV1deIXGwGqFFIs1noja4oHSToIb3M++boSgK3Sf/1mfnEhjhF
	IeuVaPCQ79Iw0T2H00XtMID1jK3k48YNvi6/IbEv2b3PCzuAnxjLVUGEMrWMlryMN+psbhMWP06
	ThdBrHLAKUXfFf51AUGv/2b2telzsZ8vi71FC1lnzxbbh7E2IucH1F/SdimWfuP+8Jj8iL/xzre
	juBS5WnBWGCwUgG84NW2ThfT1XwUWnsDy+m+EOGsJ22nJmqtDu0tbCSoQ/IqJ/GxBCQYIluCIsv
	Wi1AyOXRHE199VgnHee6c5nX70yC8=
X-Google-Smtp-Source: AGHT+IHN48yvMIOaDGPbWMm5BvPhGs77+H56lAsXmbWsxboZWIezlwNu0fTzpiHSFU/TXF+2n2VelQ==
X-Received: by 2002:a05:651c:541:b0:378:cd74:a288 with SMTP id 38308e7fff4ca-378cd74a6c3mr32703171fa.10.1761331623300;
        Fri, 24 Oct 2025 11:47:03 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67c0103sm12622741fa.30.2025.10.24.11.47.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 24 Oct 2025 11:47:02 -0700 (PDT)
Date: Fri, 24 Oct 2025 20:46:58 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: x86@kernel.org
Cc: regressions@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Yazen Ghannam
 <yazen.ghannam@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Eric DeVolder <eric.devolder@oracle.com>
Subject: AMD topology broken on various 754/AM2+/AM3/AM3+ systems causes
 NB/EDAC/GART regression since 6.14
Message-ID: <20251024204658.3da9bf3f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This report is related to discussion here:
https://lore.kernel.org/all/20251022011610.60d0ba6e.michal.pecio@gmail.com/

Commit bc7b2e629e0c ("x86/amd_nb: Use topology info to get AMD node
count") bails out if it can't find the NB of each node reportedy by
topology. Then NB features like EDAC or GART IOMMU aren't available.

Which was maybe not a bad idea, nobody expects those things to work
on selected nodes only. (I think?) But it relies on the optimistic
assumption that topology knows the true number of nodes.

Today I tested 5 older AMD64 systems with socket 754/AM2+/AM3/AM3+
on MSI/ASUS motherboards. *All* of them report more than one node if
the CPU has fewer cores than supported by the BIOS.

(I also have one AM4 system which is OK, but can't speak for others).

This is due to peculiarity of their MADT tables - they report as many
LAPICs as the BIOS can support and excess LAPICs are simply disabled.
FWIW, it's also a pattern that disabled APIC IDs have 0x80 bit set.

The kernel counts this as "hotpluggable CPUs", since supposedly it's
indistinguishable from actual multi-socket systems before ACPI 6.3,
where the "online capable" flag was added to disambiguate hotplug and
nonexistent but theoretically supported CPUs.

Or at least that's what commit fed8d8773b8e ("x86/acpi/boot: Correct
acpi_is_processor_usable() check") seems to imply.

On pre-ACPI 6.3 systems those disabled LAPICs inflate topology size
and result in breakage on recent kernels. A few examples below give
an idea what those MADTs look like and how the kernel reads them.

Regards,
Michal


Athlon 3000+ on S754:

[02Fh 0047 001h]               Local Apic ID : 00
[030h 0048 004h]       Flags (decoded below) : 00000001	# enabled
--
[037h 0055 001h]               Local Apic ID : 81
[038h 0056 004h]       Flags (decoded below) : 00000000

[    0.027690] CPU topo: Max. logical packages:   2
[    0.027691] CPU topo: Max. logical dies:       2
[    0.027692] CPU topo: Max. dies per package:   1
[    0.027703] CPU topo: Max. threads per core:   1
[    0.027704] CPU topo: Num. cores per package:     1
[    0.027705] CPU topo: Num. threads per package:   1
[    0.027706] CPU topo: Allowing 1 present CPUs plus 1 hotplug CPUs

Athlon II X2 250 on AM3+:

[02Fh 0047 001h]               Local Apic ID : 00
[030h 0048 004h]       Flags (decoded below) : 00000001 # enabled
--
[037h 0055 001h]               Local Apic ID : 01
[038h 0056 004h]       Flags (decoded below) : 00000001 # enabled
--
[03Fh 0063 001h]               Local Apic ID : 82
[040h 0064 004h]       Flags (decoded below) : 00000000
--
[047h 0071 001h]               Local Apic ID : 83
[048h 0072 004h]       Flags (decoded below) : 00000000
--
[04Fh 0079 001h]               Local Apic ID : 84
[050h 0080 004h]       Flags (decoded below) : 00000000
--
[057h 0087 001h]               Local Apic ID : 85
[058h 0088 004h]       Flags (decoded below) : 00000000
--
[05Fh 0095 001h]               Local Apic ID : 86
[060h 0096 004h]       Flags (decoded below) : 00000000
--
[067h 0103 001h]               Local Apic ID : 87
[068h 0104 004h]       Flags (decoded below) : 00000000

[    0.147372] CPU topo: Max. logical packages:   3 # not sure why not 4
[    0.147372] CPU topo: Max. logical dies:       3
[    0.147373] CPU topo: Max. dies per package:   1
[    0.147379] CPU topo: Max. threads per core:   1
[    0.147379] CPU topo: Num. cores per package:     2
[    0.147380] CPU topo: Num. threads per package:   2
[    0.147381] CPU topo: Allowing 2 present CPUs plus 6 hotplug CPUs

Phenom II X4 965 on AM3:

[02Fh 0047   1]                Local Apic ID : 00
[030h 0048   4]        Flags (decoded below) : 00000001 # enabled
--
[037h 0055   1]                Local Apic ID : 01
[038h 0056   4]        Flags (decoded below) : 00000001 # enabled
--
[03Fh 0063   1]                Local Apic ID : 02
[040h 0064   4]        Flags (decoded below) : 00000001 # enabled
--
[047h 0071   1]                Local Apic ID : 03
[048h 0072   4]        Flags (decoded below) : 00000001 # enabled
--
[04Fh 0079   1]                Local Apic ID : 84
[050h 0080   4]        Flags (decoded below) : 00000000
--
[057h 0087   1]                Local Apic ID : 85
[058h 0088   4]        Flags (decoded below) : 00000000

[    0.072112] CPU topo: Max. logical packages:   2
[    0.072112] CPU topo: Max. logical dies:       2
[    0.072113] CPU topo: Max. dies per package:   1
[    0.072118] CPU topo: Max. threads per core:   1
[    0.072118] CPU topo: Num. cores per package:     4
[    0.072119] CPU topo: Num. threads per package:   4
[    0.072120] CPU topo: Allowing 4 present CPUs plus 2 hotplug CPUs
