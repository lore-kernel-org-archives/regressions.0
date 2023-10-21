Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F51A626
	for <regressions@lists.linux.dev>; Sat, 21 Oct 2023 00:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bens.haus
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bens.haus
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bens.haus header.i=@bens.haus header.b="U4ruX1La"
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
	by w4.tutanota.de (Postfix) with ESMTP id CFD011060170;
	Sat, 21 Oct 2023 00:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1697846876;
	s=s1; d=bens.haus;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=Sw9x7wuuA1QNrztZOrHa/S9dqjr9j06JtwY8MvJxGR0=;
	b=U4ruX1LaDK1WgzzvxwkFPrvUBJ2D5dKO0dBUlsQDA+z18DRSLkDdv20fDvBFYkpn
	wJK+8iaTVlga43jzXy62RzAx4snpdvcSGHtdN3dEi5s8LebtQ/NAtFjQSeCHtbA7klj
	a/TIC00+68zOrXZCs2oCgkra4nFPbecTpoXHhycrqmXLi1LOcJM494PY48fb3rFd2FT
	3U285vwOHf5hJLAOSkmLYcxrJW6x07rUm+zDWUeMSCKI7Yze7zTcl79eyCugnA1SiE0
	RRGqJ9CxBD93xsKidaCH99TkiL/Lia51vCaeErE3cOF3Sy0F7MEiCzYwvuzhSxg5B//
	ZIR6USBkHw==
Date: Sat, 21 Oct 2023 02:07:56 +0200 (CEST)
From: Ben Schneider <ben@bens.haus>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Regressions <regressions@lists.linux.dev>,
	Linux Efi <linux-efi@vger.kernel.org>,
	Stable <stable@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <NhEYpWg--3-9@bens.haus>
In-Reply-To: <Nh8pThy--3-9@bens.haus>
References: <Nh-DzlX--3-9@bens.haus> <CAMj1kXFKe6piagNLdSUhxUhwLB+RfNHqjNWt8-r2CNS-rBdJKA@mail.gmail.com> <817366c2-33e0-4908-90ec-57c63e3eb471@canonical.com> <CAC_iWjJB3OTWiYX5YsJmNcPQw+rHSm955c1Z5pUajedWGM5QgA@mail.gmail.com> <Nh30qsF--3-9@bens.haus> <57062702-f858-46d3-bccc-f0f96891128b@canonical.com> <Nh8pThy--3-9@bens.haus>
Subject: Re: [REGRESSION] boot fails for EFI boot stub loaded by u-boot
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Oct 20, 2023, 01:25 by ben@bens.haus:

> Oct 19, 2023, 07:21 by heinrich.schuchardt@canonical.com:
>
>> Compiling upstream U-Boot's qemu_arm64_defconfig yields lib/efi_loader/dtbdump.efi. If you run this instead of the kernel, you can write the device-tree as it is passed in a configuration table to the ESP.
>>
> I compiled and ran this fine, but I was unable to save the device tree. I suspect this is because the program searches for an ESP, and there is none on the device. U-boot was compiled with support to load directly from an ext4 filesystem so I didn't bother setting one up. I will work on it. 
>
Hi Heinrich, I loaded dtbdump.efi from a FAT32 formatted partition with type EFI System, but attempts to run the save command return "Failed to open simple file system protocol". Sorry if there is something else I am missing.

Ben
