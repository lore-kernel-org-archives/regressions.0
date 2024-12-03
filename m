Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787E1F7083
	for <regressions@lists.linux.dev>; Tue,  3 Dec 2024 14:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733237116; cv=none; b=aH4geKTYpPpAT27Ijbjq/sLHay+drXvnGNptZxs630yJUh806LgeB4vzZe3JlApKgfvPseBlNMOFD+ohvk5kbuXUEkftR0h2tgO02WCn162kEklJsceq4NHvgzNn+dJp9TN0qOU98ZXU5Aq3i+AmpEC0ehFabqUoL6TJLhJvE9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733237116; c=relaxed/simple;
	bh=XN8ES0rHOFOYBm7jewQYFcVIpPB9gtMoX1yXuz3STQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjUjaeql589RzyNBKqZwVQCRlCUB1guIZxdihOQjNWtU2okHP8tdGfk2YUsb8FkhgfglOaC8HLsFslEsdwreB5MvQIvFnjMa/i164SF3dgkDHb8jxsbN/xnNyxPMNhjWjTBsEtYkHYLNxuDFzUulwFOiS7Vyeu4jxO1sVoYlkhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eu5UVPaI; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eu5UVPaI"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so6769064a12.0
        for <regressions@lists.linux.dev>; Tue, 03 Dec 2024 06:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733237112; x=1733841912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z02kD3ptGLXxLPiul0GJ51OSn05xcfsBoxVOvzJnNTk=;
        b=eu5UVPaI9Z5+YkifzEYaCQhr68cA1EY/7yrR+Gnu/c7eJkn1b9mIjjGh4gFKzWQYCy
         jq4T3TonDKlWlxX1NKiWJ1j6uwRryLwjFWCWFTIkWPOwJI0NNrzdkgziwM0G8SsXHbQ8
         qBiugvrycIBTffxFZVrorEV+Smnt1CblZmQllqOGzSUL1QiuvpwNzoQM5EkLaYGfWecX
         u3oqVfycsCXBfnVK3vpAo8fmkAEDJHcRJBipAuioiBh1WgyKkXSZA/VULtE+Or8ot6KA
         5k/x8RNlftdRopCAWdnE3s0WOmDrR9E/lvWyRo05EK33PjvFN6MAEO73dzEVMSN7LaKy
         9m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733237112; x=1733841912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z02kD3ptGLXxLPiul0GJ51OSn05xcfsBoxVOvzJnNTk=;
        b=w5OBJDXiXMj6xZ9/as3GyLl2QJtWo5ML3qjnadl7WK6qjDHMAYJjbtE55C6aeCHpp6
         XgKNMZF9sbl1Rd5zaBQoGTJh8gung2xmY9Y1/nKw5AdgfNIxJuCCnKWGkoMPlpHPQTfN
         iBuuJZS4hx9vairIoo9fBno3O0E0BRaEvydexh4GHnoI3gH02AB70hvJBjhvj3BWG2pJ
         BENXVk9TQFUl/ZOvH+PGBDFNkLYsa+gPGmcBSHcvf2JJil+a/V3xO0dzyPrvFjGZbXlw
         ensGgb0aoif1o0qXlWYi06Cu9+v19/LcgQCT+Dlc9j7UY9LgAAfPhMuw/a2mDUZxhhXj
         IhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsEeZ+7b0Qs7Kh/ZIRnm7KfpBuT0Y+KfRsszHY81G7IZ1qYgbju5bgRWdwtSb7BjHi1KbAhCRqYBR/cA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyQ2aqRQYa1R59whtEvbbKydiv98M1Ur2QnBFOU5jFJPkEZ8Iz
	aeeYIZifHLbMRKb7NrwDRQItSYR0oJJ0Tb+0G2k9OxBhQH98j/rc
X-Gm-Gg: ASbGnctL2ixKvUgvjAPbAiRqhFwkjysVEmKtXoH2Gv7ZzEoTQwmf4QVdFr3sdIQifnz
	mGbq1us6N4NqEya5S7FeYSj8t368hsnH+VvWYNMab3iahi/mJnpyEgifxeppvaXAEuUOecl8Aus
	RpuQ7UDkGfYv+JAzzioMzYF4UTa2L9wErvG6OtgEQPJ8Ek47qUCbnIMnNtwhewht5k0/6QCm2kT
	DCVUVCRvXWSATPH8OQ5UCaFoZ+IYOb6i6Z8vmZsVLEVcpnb5VIN6WFYErwqOFPuyV7EtB3gBg/9
	CCD2gxIaww==
X-Google-Smtp-Source: AGHT+IE/Bn2fcuUlIImOBoxukH5+B0LMPADawiYsSHDX+FHVMxtEyUFbGv8mThyhcbxmpLz0M1ZQog==
X-Received: by 2002:a05:6402:1d54:b0:5d0:f830:ef4e with SMTP id 4fb4d7f45d1cf-5d10cba37a1mr2595659a12.34.1733237112236;
        Tue, 03 Dec 2024 06:45:12 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097d9f5fdsm6172512a12.15.2024.12.03.06.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:45:11 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 7684CBE2EE7; Tue, 03 Dec 2024 15:45:10 +0100 (CET)
Date: Tue, 3 Dec 2024 15:45:10 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Paulo Alcantara <pc@manguebit.com>
Cc: Michael Krause <mk-debian@galax.is>, gregkh@linuxfoundation.org,
	Steve French <stfrench@microsoft.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev, linux-cifs@vger.kernel.org
Subject: Re: backporting 24a9799aa8ef ("smb: client: fix UAF in
 smb2_reconnect_server()") to older stable series
Message-ID: <Z08ZdhIQeqHDHvqu@eldamar.lan>
References: <2024040834-magazine-audience-8aa4@gregkh>
 <Z0rZFrZ0Cz3LJEbI@eldamar.lan>
 <2e1ad828-24b3-488d-881e-69232c8c6062@galax.is>
 <1037557ef401a66691a4b1e765eec2e2@manguebit.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1037557ef401a66691a4b1e765eec2e2@manguebit.com>

Paulo,

On Tue, Dec 03, 2024 at 10:18:25AM -0300, Paulo Alcantara wrote:
> Michael Krause <mk-debian@galax.is> writes:
> 
> > On 11/30/24 10:21 AM, Salvatore Bonaccorso wrote:
> >> Michael, did a manual backport of 24a9799aa8ef ("smb: client: fix UAF
> >> in smb2_reconnect_server()") which seems in fact to solve the issue.
> >> 
> >> Michael, can you please post your backport here for review from Paulo
> >> and Steve?
> >
> > Of course, attached.
> >
> > Now I really hope I didn't screw it up :)
> 
> LGTM.  Thanks Michael for the backport.

Thanks a lot for the review. So to get it accepted it needs to be
brough into the form which Greg can pick up. Michael can you do that
and add your Signed-off line accordingly?

Regards,
Salvatore
