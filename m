Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFCA3E9F99
	for <regressions@lists.linux.dev>; Tue,  3 Mar 2026 17:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772559163; cv=none; b=lgj7DPXGlc7r7Y11nNobShDwz30nAEaw82Me3acaODq+tQF7kkvEsMoL1mtfiR8rwJ+DS0tR4fTl4BBsuJd7unEupxXXCgk1BIFrX+775ecwKiFOY0aKG2e1mTPy3wuo1ebESqVYfMDqeBROFoAuf0gGVAbkYPCfbSiw0uSMWxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772559163; c=relaxed/simple;
	bh=QSLfbdC0sQ6OKC02upcBtCsQq8vNKhZu69qDiniK9ck=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fHqNbtRGGU8UanwO0ItEPh1+YXTDIoUOUPJ7hiBIc6ptrWvmA+NyN0mWtpqRHtyEnHfC90njH/I+SARIdaf0u2VlqqsQcwjCQoS9XqSndCwVYtjEq4sM06Xzb0YLcrLMZLGgvL3eFxFcf7Zkvc9CRS5YsZpi3rJarYjSSi5fF2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYEy1/l5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYEy1/l5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483abed83b6so49755585e9.0
        for <regressions@lists.linux.dev>; Tue, 03 Mar 2026 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772559160; x=1773163960; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MsWzxLM40+G5660pg9qYSB4crP9FXQmc2eGQLniMFbc=;
        b=BYEy1/l5aedvgZIOXXLw0OgowVl5ZmMK9I4saBFEHJX4UKYIEr3xEnivi6sluTwWm9
         HEX680L39olKl4SJuI2tOg75KFDdpqj/UaHzgABYwqfga0Tfsa1T6AvAjfxAgYGCwO4M
         LwUQ9sGTVYQY8MZ/Ul859o8j0cHk2PQhWnavps6/AlpwVDVJzI/SKNo9fZm89ycjRg4v
         YwA4Z/H62Pa8mGT+SPjDL4/G+ISy2Wl2fb2NwmxbJZRJ2lXdO4OZx0NS8G7EXMgBOoah
         9JdrAd8Xk4PZepslnoAkVjxCZ198OMGnXmIJJ7idomKYyq2BDiVJocdsLfZTImR4hqK6
         +lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559160; x=1773163960;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsWzxLM40+G5660pg9qYSB4crP9FXQmc2eGQLniMFbc=;
        b=wMnL8BS3H3VZPW/A1srML1lWrojRMiTlB8QUeyknOzD28qYrhw8qmHWFkNlVUexYCl
         25rWIMw8Thk88/9goJcJsSNDTEb1t33bVcskJqEISW+Rsar+UMsEXOLxOo0ztrTzvtwO
         Up7QjKV1um95IkDo/JCYGgcPRk/fLqs7G0qUKFm6vi4DpefUWTlapJ7Zzh37RPWdIugM
         m1ItzQlTwzuYWddJW1xC8UEQ0G+pJGneSglmlSCKHoREPvXvEbndRxF9ctPSoJrZxEpY
         VaEka3FjF9D9w240bW2gRgD1avQHYp9GWvhTkDxmTnwLp2ty+YdmSXvY2ZMURQiFN7oq
         GivA==
X-Forwarded-Encrypted: i=1; AJvYcCVbuCC1KjPL0w0Fu1iFKLwSfMP1SZhaUbJYdjU+gfuCGX+lL8+lIMFILBz9Z8YRaxxgmdTvn8VD0h+ofA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9OczW4EUhDnWKkwO82l/UrHE3gG4nxlcSv8ljcFRv6FNMD1tP
	OUTx905EDCW+p9annRhv7CfXKuazi7EnhCvLpDeIEeQefmYiFByKPO4Q
X-Gm-Gg: ATEYQzxFAGXMX40KmXOH1ETBJekS0qMbnOObBdXtA3WYw8MJN46QyfW+Jy+7+tGvrS4
	/qS9FzmVg/mFzDNUzalCezvfV78ePy1xIfE6WL2vIA2BoBDeWIsG8/5bbNgrvPhSJBvFztREJDK
	436Kb3bYmOJrxgdqUeXSnxE59VjSlwyz8bEh+neKeVOvZGg+qhjdBFlPQ+Dob4SJKnhX/2Oe3LS
	FzNLK+tV+q982oMIbCATQ43xm1SelDiwxGtJkG1SlA5DUD4HQTx/oMImYTr/y/GSrkOcLAEg91f
	y8A+oqahwfrU9Fo+MASvu5di78+NYAJ8KN4XidJfzfbYZPQF3slKZhvUYx6H4nFa5Ji/hgqfnuT
	DK2nCI/I2Rc6SsYiIIqZrXJyboFhUdRYhgK1T039YVh63t+VzZFBFN7Y0yN6blwflEn9p6FOfxX
	pKyZxtsMBOzn4CjtmMQzpvENCJnJv4qyT0fZfmjzqi
X-Received: by 2002:a05:600c:674f:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-483c9bde826mr284998005e9.18.1772559160210;
        Tue, 03 Mar 2026 09:32:40 -0800 (PST)
Received: from holly.home.arpa ([2a03:ab00:1000:1b60:331a:b316:78f6:effc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485133a9511sm24583545e9.17.2026.03.03.09.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:32:39 -0800 (PST)
Message-ID: <ce07b65b86473acac101c4854f6201d05597d48c.camel@gmail.com>
Subject: Re: [REGRESSION] 6.19.4 stable netfilter / nftables [resolved]
From: Jindrich Makovicka <makovick@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Genes Lists
	 <lists@sapience.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, coreteam@netfilter.org, 
	netfilter-devel@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, 
	stable@vger.kernel.org, regressions@lists.linux.dev, "Kris Karas (Bug
 Reporting)" <bugs-a21@moonlit-rail.com>
Date: Tue, 03 Mar 2026 18:32:39 +0100
In-Reply-To: <d43b9da4-99ee-4516-9bec-71a9de19618e@leemhuis.info>
References: <a529a6a9a2755d45765f20b58c5c11e2f790eacb.camel@sapience.com>
	 <45f03b0b-fe8f-4942-bad1-3fbde03d4be1@leemhuis.info>
	 <143e1a402ad78dd7076516a6ceb637f378310b16.camel@sapience.com>
	 <10537f2b74da2b8a5cb8dc939f723291db39ff84.camel@sapience.com>
	 <2026022755-quail-graveyard-93e8@gregkh>
	 <b231fcdb6c66a7b24dcef3ee5c35c5f612d5c1a7.camel@sapience.com>
	 <9d110d860c0c7e110d018ea53a7666eba275da20.camel@gmail.com>
	 <d43b9da4-99ee-4516-9bec-71a9de19618e@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-03-03 at 08:31 +0100, Thorsten Leemhuis wrote:
> On 3/3/26 08:00, Jindrich Makovicka wrote:
> > On Fri, 2026-02-27 at 08:39 -0500, Genes Lists wrote:
> > > On Fri, 2026-02-27 at 05:17 -0800, Greg KH wrote:
> > > > On Fri, Feb 27, 2026 at 08:12:59AM -0500, Genes Lists wrote:
> > > > > On Fri, 2026-02-27 at 07:23 -0500, Genes Lists wrote:
> > > > > > On Fri, 2026-02-27 at 09:00 +0100, Thorsten Leemhuis wrote:
> > > > > > > Lo!
> > > > > > >=20
> > > > > >=20
> > > > > > Repeating the nft error message here for simplicity:
> > > > > >=20
> > > > > > =C2=A0Linux version 7.0.0-rc1-custom-1-00124-g3f4a08e64442 ...
> > > > > > =C2=A0 ...
> > > > > > =C2=A0 In file included from /etc/nftables.conf:134:2-44:
> > > > > > =C2=A0 ./etc/nftables.d/set_filter.conf:1746:7-21: Error:
> > > > > > =C2=A0 Could not process rule: File exists
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xx.xxx.xxx.x/23,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^
> > > > > >=20
> > > > >=20
> > > > > Resolved by updating userspace.
> > > > >=20
> > > > > I can reproduce this error on non-production machine and
> > > > > found
> > > > > this
> > > > > error is resolved by re-bulding updated nftables, libmnl and
> > > > > libnftnl:
> > > > >=20
> > > > > With these versions nft rules now load without error:
> > > > >=20
> > > > > =C2=A0- nftables commit de904e22faa2e450d0d4802e1d9bc22013044f93
> > > > > =C2=A0- libmnl=C2=A0=C2=A0 commit 54dea548d796653534645c6e3c8577e=
af7d77411
> > > > > =C2=A0- libnftnl commit 5c5a8385dc974ea7887119963022ae988e2a16cc
> > > > >=20
> > > > > All were compiled on machine running 6.19.4.
> > > >=20
> > > > Odd, that shouldn't be an issue, as why would the kernel
> > > > version
> > > > you
> > > > build this on matter?
> > > >=20
> > > > What about trying commit f175b46d9134 ("netfilter: nf_tables:
> > > > add
> > > > .abort_skip_removal flag for set types")?
> > > >=20
> > > > thanks,
> > > >=20
> > > > greg k-h
> > >=20
> > > - all were rebuilt from git head=C2=A0
> > > =C2=A0 Have not had time to explore what specific change(s)
> > > =C2=A0 triggered the issue yet.
> > >=20
> > > - commit f175b46d9134
> > > =C2=A0 I can reproduce on non-production machine - will check this an=
d
> > > report back.
> >=20
> > I had a similar problem, solved by reverting the commit below. It
> > fails
> > only with a longer set. My wild guess is a closed interval with
> > start
> > address at the=C2=A0 end of a chunk and end address at the beginning of
> > the
> > next one gets misidentified as an open interval.
> >=20
> > commit 12b1681793e9b7552495290785a3570c539f409d
> > Author: Pablo Neira Ayuso <pablo@netfilter.org>
> > Date:=C2=A0=C2=A0 Fri Feb 6 13:33:46 2026 +0100
> >=20
> > =C2=A0=C2=A0=C2=A0 netfilter: nft_set_rbtree: validate open interval ov=
erlap
> >=20
> > Example set definition is here:
> >=20
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D221158
>=20
> Does that problem happen with 7.0-rc2 as well? This is important to
> know
> to determine if this is a general problem or a backporting problem.
>=20

Yes, the same problem shows up with 7.0-rc2. I updated the bugzilla
attachment to reproduce the bug just by feeding it to nft,

# uname -a
Linux holly 7.0.0-rc2 #25 SMP PREEMPT_DYNAMIC Tue Mar  3 18:17:21 CET
2026 x86_64 GNU/Linux
# nft -f test-full.nft
test-full.nft:1643:1-25: Error: Could not process rule: File exists
12.14.179.24-12.14.179.31,
^^^^^^^^^^^^^^^^^^^^^^^^^

Regards,
--=20
Jindrich Makovicka
