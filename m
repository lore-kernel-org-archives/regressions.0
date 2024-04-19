Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14E813C91B
	for <regressions@lists.linux.dev>; Fri, 19 Apr 2024 20:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713557537; cv=none; b=A1AT/HBshP0Ug+XpOJl44lK4tZ1K46p1iaU2FTG+3tnv3P/hht6t1DlSk+wEWimOYY76sPxjgihxbp73Nx4GHstnS89IfMd+3R7Yf1HDQk2ztpbfSVmg3A1musN4LiV6hQC8eLPZ14iIBQQSTxreQzrzaE8M5buCM/xUYbKvG0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713557537; c=relaxed/simple;
	bh=nPHvh3DkiBgyvr/B9kszo7qSn9jSsyNQbHvayINckmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCtETyIlWeeO/hifDbN5twGdBsiIvTUp7p5BuORSGymmeqd4dxcKHG1KygQ3DMi/G8YLz+crLexstvpm+lQrxbZB1on3qOzEWkrKFgYT3X2PD3l8BnVC0xXocDweupTKO08PgGAmyxyjPXtEpF+ZUVp/8xzM7Ma+vIWIXQvZrUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOjgbSaN; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOjgbSaN"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56e6affdd21so1128072a12.3
        for <regressions@lists.linux.dev>; Fri, 19 Apr 2024 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713557534; x=1714162334; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQR7nTkye4AVZtx+ZZbC5oLR5EmGS6z2i/4lvmSfqDo=;
        b=XOjgbSaNY2Qxiho5KDC4ThXzL8D5Mo/IBvtQVE91Gsfn8y+pKhDsESlcrP0ufwd5ZM
         MsBPSK/FfQwLifg98nuXyxov7vSX8Ye+QfDknTIIXheVcNR1pC3uUlWbCFI5CEb0gaJp
         OG1HQVtBkYGcos3npLSgwH73TNwnrTAxd6azdenT2IPLdNUmOt3AKJXtHLT6ZQOXO09g
         FWzakCnfxCkDDIdDbq6JriYkg5J0mlvYNUUS8ZBZpM41nMebhCm0IGlC4bTOD0ehVN/U
         GRjhm64yWyj9j0wFLI3+hTjdRw1XPAV6BER2zSlk0uqEK/DdFF9pC7C8wLacMflIp79O
         gtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713557534; x=1714162334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQR7nTkye4AVZtx+ZZbC5oLR5EmGS6z2i/4lvmSfqDo=;
        b=LP+FKoVm6H6ms0Cg3elcWuWg+yVZC4HL0ZLYPCZ31OVYdvjYac9v5R2+fao4io+HMO
         hB/cbCSfTBf+h8xHnOIZeQ+/NAeUiUulD4VH5yhYS9ZgOfNX5DZe01XiWPGMlGY/2dS5
         p6eiN15HNLOT0wL3ctHJnbz1YXS9nw6WKdU7D5YE3B4yIH89PDtix0QpMF/wnolkyeE1
         /yXB+6YL7EoCe46lITsQD2hg/i3BZVm2KxkoCJ+WeyOv6kwg+pB/pwgxbqlrALzIHba8
         otQO9+BqEDhIqg0I5Recff+dzXb3m1yBBCEds8BlGuNNbVb/0l2i0NL/nCFsT4r185pP
         lp+Q==
X-Gm-Message-State: AOJu0YyyyzuPmOq9O4HgmIX7WXZtsi621WBdPW1AlBBaswUeel/Fet+s
	qqfdfEMGlTcNgjgZRg58/wM26fF3i43r7EIBQPHvIQ16jKhwbRsF
X-Google-Smtp-Source: AGHT+IGOHAF5nkXJuC88UzrlA2WgNUXaH2KnFa4PsZZwcaO1GcXKC2SWKsteBi2XE0Xb0zFDe+LUrw==
X-Received: by 2002:a50:a451:0:b0:56e:3293:3777 with SMTP id v17-20020a50a451000000b0056e32933777mr2576385edb.17.1713557533455;
        Fri, 19 Apr 2024 13:12:13 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402101a00b0056e66f1fe9bsm2488468edu.23.2024.04.19.13.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 13:12:12 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id A93CABE2EE8; Fri, 19 Apr 2024 22:12:11 +0200 (CEST)
Date: Fri, 19 Apr 2024 22:12:11 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Paulo Alcantara <pc@manguebit.com>
Cc: regressions@lists.linux.dev, Steve French <stfrench@microsoft.com>,
	gregkh@linuxfoundation.org, sashal@kernel.org,
	stable@vger.kernel.org, linux-cifs@vger.kernel.org
Subject: Re: [regression 6.1.80+] "CIFS: VFS: directory entry name would
 overflow frame end of buf" and invisible files under certain conditions and
 at least with noserverino mount option
Message-ID: <ZiLQG4x0m1L70ugu@eldamar.lan>
References: <ZiBCsoc0yf_I8In8@eldamar.lan>
 <cc3eea56282f4b43d0fe151a9390c512@manguebit.com>
 <ZiCoYjr79HXxiTjr@eldamar.lan>
 <29e0cbcab5be560608d1dfbfb0ccbc96@manguebit.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29e0cbcab5be560608d1dfbfb0ccbc96@manguebit.com>

Hi Paulo,

On Thu, Apr 18, 2024 at 10:47:01AM -0300, Paulo Alcantara wrote:
> Salvatore Bonaccorso <carnil@debian.org> writes:
> 
> > On Wed, Apr 17, 2024 at 07:58:56PM -0300, Paulo Alcantara wrote:
> >> Hi Salvatore,
> >> 
> >> Salvatore Bonaccorso <carnil@debian.org> writes:
> >> 
> >> > In Debian we got two reports of cifs mounts not functioning, hiding
> >> > certain files. The two reports are:
> >> >
> >> > https://bugs.debian.org/1069102
> >> > https://bugs.debian.org/1069092
> >> >
> >> > On those cases kernel logs error
> >> >
> >> > [   23.225952] CIFS: VFS: directory entry name would overflow frame end of buf 00000000a44b272c
> >> 
> >> I couldn't reproduce it.  Does the following fix your issue:
> >> 
> >> diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> >> index 4c1231496a72..3ee35430595e 100644
> >> --- a/fs/smb/client/smb2pdu.c
> >> +++ b/fs/smb/client/smb2pdu.c
> >> @@ -5083,7 +5083,7 @@ smb2_parse_query_directory(struct cifs_tcon *tcon,
> >>  		info_buf_size = sizeof(struct smb2_posix_info);
> >>  		break;
> >>  	case SMB_FIND_FILE_FULL_DIRECTORY_INFO:
> >> -		info_buf_size = sizeof(FILE_FULL_DIRECTORY_INFO);
> >> +		info_buf_size = sizeof(FILE_FULL_DIRECTORY_INFO) - 1;
> >>  		break;
> >>  	default:
> >>  		cifs_tcon_dbg(VFS, "info level %u isn't supported\n",
> >> 
> >> If not, please provide network trace and verbose logs.
> >
> > Yes that appears to fix the issue.
> 
> Thanks for quickly testing it.  So the above change indicates that we're
> missing 35235e19b393 ("cifs: Replace remaining 1-element arrays") in
> v6.1.y.
> 
> Can you test it now with 35235e19b393 backported without the above
> change?

Done. From the experiment in the avialable setup this seems to indeed
fix the issue. The commit can mostly be cherry-picked with one manual
whitespace caused fixup.

> > But as you say you are not able to reproduce the issue, I guess we
> > need to try to get it clearly reproducible first to see we face no
> > other fallouts?
> 
> I couldn't reproduce it in v6.9-rc4.  Forgot to mention it, sorry.

Ack understand.

> Yes, further testing would be great to make sure we're not missing
> anything else.

I'm still failing to provide you a recipe with a minimal as possible
setup, but with the instance I was able to reproduce the issue the
regression seems gone with cherry-picking 35235e19b393 ("cifs: Replace
remaining 1-element arrays") .

Regards,
Salvatore
