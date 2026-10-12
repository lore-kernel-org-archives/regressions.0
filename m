Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEDD190473
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 17:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826109; cv=none; b=fLVxxOWNHaTt97JqqotEt08ALUSveN7iPLnDkCP4qqGfJgNlGp63s4cN3biV7wJ9V3snVT9LGAsCNJMf16ZZu91owLRoM6gtfHt7mwgEXiryfr/4txYQ3liogx54uMOYBEKtkUgVqISV+mGuXD212+8u/t3eiyk1YIumuIfs6Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826109; c=relaxed/simple;
	bh=AXdyOooEc3hDa63HwNXV9g3HS0K5zwoBhEQ215I6LyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqnX0qeNc38+ybjd0tI+8xerh3G9rWX4X5AvEtVFqS/RMc6WJeyNILF3dWqUocM6xCq7qPMw+WGd3XaqnUSz3JOLwut9b4mWkVOqSH2iSx2TkdBMk+6EaDLZ5GK2K7oov34pw+IXnbCnxAhTvRhICPpZseoWvaJyqqi9KW9j23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKhdLOQt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKhdLOQt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so15830705e9.1
        for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 10:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791826107; x=1792430907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YveKtGz1EIX08GUJXyM9GGRIHFuaJbA/DcyfZ3t4Uc4=;
        b=tKhdLOQtBBstleUuOq+kmOi+gT1fOAWN4c9z33iMDKFPywc4eVb5sVRgRGhVt7JhwZ
         T/fEhOlKDn/tjkQXE2poYUbjQZOSuIjWeTxuckzpQNZpVCKafL4tit6MZhJPHJaXuCTA
         iimDXXO4zT/TXfmn+uX7stqr04vraHy4bkKhgmxYYUfIQpmwZFNfrWfk9Og/9w/2llnr
         XGuRVvYmleHfnrF7ZIeDHbXKOipWVJhQhEApg5m6ut6VfG4kt4b0a6gvlf9bOa5mJRSe
         2U35O6kCe6sSqs2231sKbLW9YZYJL4Wicb0HcJ1C/ABNoVnzLD59fptrmAth8FU5djoE
         8S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791826107; x=1792430907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YveKtGz1EIX08GUJXyM9GGRIHFuaJbA/DcyfZ3t4Uc4=;
        b=CnSWD9EHo1goKbReBJiCxXIg8MnDn5W4q5x3uB6gtaOl3uxGZtwyAFAL4urQeiDwtO
         siAc33bStfKfVLPoJjM0Y6GwKr+LG/2v6plLHOGZ+W9jFByW2LAc/ic6NldtWHKNa9Gs
         1WXbIFuAbNPArOEXPC7SunpO2C+OWhJLgoLSXGSDSRQycJ+ZHv9N3EFdxINb8jMb8TwZ
         qb0yC1e/t9PJLm549KuzI6yfZNFy5Id/ZmJ+xEWFlHAcviKdvOpJwK3AuA2zFeI410/K
         H3qBax8wyH4U+MbLZve34ljrgYlytLWYvC4RhupOcWynx6elqNNBCau6xt9CvQGn5tb3
         8PDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuaqLHwAqiXjE2/u415Yb3Nfhq5NsZ+WpsDqM1A/XMl6pllq+K73AERi9qxxnHHlLvI+MEHOLufTQjgA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIM/njo/76wAdJ8jDFKgw/CnSXNGnHsYSVMs3B6SWguBnAX0Mo1
	kQV3neZiLTdE2pQTNnUIqppgA5qDqnr7i4QG5ZPwIiwciANBEBTT0LQU
X-Gm-Gg: AYBFou1urIVPr/sel0+5gtyelYLeRx/HmD1IclprjZaJjHrARVzy+t84ouX8HLRRRih
	kQUrfWqJ/VRmcGiWtRViH4G4jU/G0TtQRDK/RAl6qQ7odPaGzCPAckQi0p8ZvSISseQzA5QOFlU
	npVc70cnq7u3Ps5F8DBMvuNhVJ+ylqqFQbpFk3KhrJHPNpgWBE2JX0xtLcfY3zlkjSWsrqn1lTO
	dTHKlv/JcAEcMxJWAGUpicVEwb3YDIMxvwVEocOquMlMJetvagSm7e5y+Q5zlm7mYeyPWSqHFOE
	agXHOdSkVbYX2kwSaHAD19iq2rVWYcyhDt6xi/euKayXufSLYKZVmpxHz0keVnouO2AoO+imvvU
	+NrNYiC0l1ZUvG4Ynl/I00FMGQP+tUAKFYKfWs9cJIc6W9bv1i4FlPfB4iKM9/FQe7efH1lrSdq
	q2rcP4NKD0tw6TuL0B+BzqgjOOvXSAS1+0JcuBFZHhdPq/uMeLoaLIb6DlRAx/CzwpqmPjbxxh9
	jzZIDJd94PIU6Pb3WmV1ndqsbuWMoHIgQ==
X-Received: by 2002:a05:600c:310b:b0:4a1:813f:2a5b with SMTP id 5b1f17b1804b1-4a18e4a9da8mr184355265e9.14.1791826106280;
        Mon, 12 Oct 2026 10:28:26 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm480991455e9.8.2026.10.12.10.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:28:23 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 0CEB6DC09FD; Mon, 12 Oct 2026 19:28:23 +0200 (CEST)
Date: Mon, 12 Oct 2026 19:28:22 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Sasha Levin <sashal@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Erik Brangs <erik.brangs@gmx.de>, benh@debian.org,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	linux-bluetooth@vger.kernel.org, 1149377@bugs.debian.org
Subject: Re: [regression 6.12.y] After backport of 980084de4d9b ("Bluetooth:
 btusb: Add ASUS USB-BT540 for Realtek 8761CU") bluethooth not anymore
 working on 0b05:1bef ASUSTek Computer, Inc. Bluetooth Controller (requests
 firmware)
Message-ID: <as0YtvgukA-Gp-D-@eldamar.lan>
References: <179104011040.2214689.5921682013387867802@eldamar.lan>
 <2026-10-04-1-daily-reply-0007-bt540-asus-firmware@kernel.org>
 <24ce058a-28b5-4499-9ded-eec9544b80ec@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24ce058a-28b5-4499-9ded-eec9544b80ec@leemhuis.info>

Ciao Thorsten,

Thanks for looking into this regression as well.

On Mon, Oct 12, 2026 at 02:00:18PM +0200, Thorsten Leemhuis wrote:
> On 10/4/26 18:29, Sasha Levin wrote:
> >> In Debian Erik Brangs reported that after the update from 6.12.107 to
> >> 6.12.111, specifically with the backport of 980084de4d9b ("Bluetooth:
> >> btusb: Add ASUS USB-BT540 for Realtek 8761CU") Bluetooth is not
> >> anymore working, the full report is found at
> >> https://bugs.debian.org/1149377 .
> >>
> >> | [   38.138881] Bluetooth: hci0: RTL: firmware file rtl_bt/rtl8761cu_fw not found
> > 
> > The stable code matches mainline. The failure is a missing firmware file:
> > rtl_bt/rtl8761cu_fw.bin has been in linux-firmware only since 20251111,
> > and Debian trixie's firmware-realtek 20250410-2 does not have it.
> > 
> > Marcel, Luiz: could you, or Christoph Zwerschke as the author of the ID
> > commit, send an upstream revert, or a fallback to ROM firmware when
> > rtl8761cu_fw.bin is missing? Stable will take it for 7.2, 6.18 and 6.12
> > through the normal Cc: stable route once it is in mainline.
> 
> Hmmm, that was a week (granted: with the LPC) ago and nothing happened.
> Anyone working on this?
> 
> If not: Should we revert 980084de4d9b and its backports? Or only the
> backports to older stable series?
> 
> Strictly speaking it should be the former due to our policies wrt to
> firmware -- but I guess most users of a more recent kernels also have a
> newer firmware, so I wonder if reverting the change might do more harm
> then good now.

If my understanding is correct from a earlier fixed regression in the
ariea, aka
https://lore.kernel.org/regressions/0fd8c1c9-7f56-4bcb-a727-e4386d8ef094@online.de/
should then not only 980084de4d9b ("Bluetooth: btusb: Add ASUS
USB-BT540 for Realtek 8761CU") be reverted, but as well along
6f0624b4427e ("Bluetooth: btusb: Add ASUS USB-BT600 for Realtek
8761CU") and as well 4a23ce935f74 ("Bluetooth: btrtl: Add the support
for RTL8761CUV")?

Regards,
Salvatore
