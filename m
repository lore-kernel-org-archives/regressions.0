Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218BF25DB1C
	for <regressions@lists.linux.dev>; Sat,  8 Nov 2025 20:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762632142; cv=none; b=b2/CASJnaF7WN20Yt3gC/6hhM2P6XScUGuzV2pBx7jvbX/FqTKcYN9uUpHjPWYEtzZCI/PZ1JEJg6egkkn1D+Umo+kqOLLWVXP0IHGLKfqT105iP7xE89LLAwGd4mpCZYTypdtnTEIOCjpyW3pHXSoDOfWSqfHHkSkZwewKaS40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762632142; c=relaxed/simple;
	bh=vEZrLeBeJ7h1ipH89PqPi/zSNBxuNbQgKGCtCvuVOvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWjwKYnM+7IqPizLZHzLvUrHBSj7u8Ba+mrCoXbom2mJyeZZD2L5MNmmgu72wQHhwMpJ1YoQpl7vqaQdQBcOX7d91qrf+2dXo7x8vtzcvV0R13LRAj11VdWdcybVn6Lt9xARJUpaygwZ2i5OOOZ5F22BUYpEbAOClYraXuGLSXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=NeaG8WCG; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="NeaG8WCG"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b220ddc189so247858285a.0
        for <regressions@lists.linux.dev>; Sat, 08 Nov 2025 12:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1762632140; x=1763236940; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=afLIDtjU2jTYgwYOZlnNOt8tUMpTLcQFNlRa10jsVq4=;
        b=NeaG8WCGM7qS1LonIRqB7DSFZeuXF7phkmVfOtlojtI+lAh2/ElUNpAmxjg6rlrBbo
         l+6oUa/fiu57yZCanc5Z/yBd4+Pk9CsYYa+eyE//f1T6GhX2HGhpvzGVitpiIu7TZQ9M
         H2rOQwclE8X6iskCWoBDtiRKuli3cRwwTu27BjM6aUUN8o73XeNfywSKiTBdp0QLNtcg
         xqoYg0ZgqbTkZ1YfDKejtUxP8zBrOP2Cpaa5l2i1tTZfgXhHhqNH50O37l9ZFucPVeYp
         nUtCXXxxzvCvSAZORj9Eb38IiIZRyY+gDGq7jEuAm5SGbk0D6Vdy6A9IC80XH9yrGZAH
         B9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762632140; x=1763236940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=afLIDtjU2jTYgwYOZlnNOt8tUMpTLcQFNlRa10jsVq4=;
        b=RykifcuNKCRFHwDLh3qAX8EQZQY4tm9dAtT21kIzjoI0+txaXxAh47hmPaxF36newf
         iv5bpPCTLLKoLADXn+SkdyzddcfSWf0EwFuh1sKfNXf06cduASQK3phHHQoOiY63u1tf
         2KVPm4XaDdmAaGmfpAFIfcWWjp3MVd1mkLEbebWuSiFvaN2GNnszvC1pna7srTVyqvsy
         BjZQUVElLoyjE93lIJB7C6ibQKcc5Gxnq2RkYekN2CyjDEhRohYXIv3u/6Vh0G+xZZ1E
         Y2RCqJhOf39euQqd1aZkO6QjkQUkgUQkM+bwrD7l7+K7M8giIKxe1FcVXRTNmabCDI4Q
         ZbIw==
X-Forwarded-Encrypted: i=1; AJvYcCUIRyTXPAD8ke7B+qSmCcnqIwIJASI4Cs2LhtCCCWqkgxN33UizjpM+V8DwjOb18IJ8/0CXkaZFtiXkwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp9Mwds0Qc95q8w0s2YBzLO47sPtQhrcEiKj7gqsf4Dp5BV8aP
	mGtnppMxb6Kokl6d80w3umUlnj1q8Z2ijQP6fuj64MIOLl9M7B9tOoL5MbY2a7udVds=
X-Gm-Gg: ASbGncuyrv6zMuetpQvuyJXyhmP8DrpDvMG9ooiycT5TXCf/swpLJJe2dOYd1R1eNhJ
	Bq97gj4zNTsJsAcJn9h9NyYKqnX9sHIsPrEOLnz7JqITHxFRhvuRrXBjBtvr1Xg6xsAhYd2CKf/
	Sg0HuTH8H4j8TTO0vNRqwk6CPisTiF9/Tf644M2B2yCaCAKVgoRmq7tuft3NFYcQSHxHkyU43Ur
	PyPgXblEr3XexVUX+coT3o3X/H1dGTUmoo0sdTQU4Sxgs7mT6ZpHNQO6jiOcMMgSjpFMjK8brMp
	RysNIAOq8pOcBk6Cgqf7Vg9z/VwhJyUCH59lWu10FuduTJIDfjYyINDvizFe647W6NquimxyNst
	DZWTSRRmUPRtYDUkc1+5DT7lFL8er44rs2Ezc2F3kTFEcPzcYiuyIBXlC1th/loKy9Nb5h8eAVB
	yX9lG+JMGhY6KAKnhpetYEtQMqOIfxuA==
X-Google-Smtp-Source: AGHT+IEP6njqvP7OJ8++MLrTcCjSZ1Kt6Z5ev6k1eTY7/VIni/FZ+4NbLV9Nf5JbGDhmp9iwi4d50A==
X-Received: by 2002:a05:620a:701b:b0:8a2:319d:27c3 with SMTP id af79cd13be357-8b257f683a0mr386978485a.73.1762632140037;
        Sat, 08 Nov 2025 12:02:20 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-8b2355e9a35sm659818685a.20.2025.11.08.12.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 12:02:18 -0800 (PST)
Date: Sat, 8 Nov 2025 15:02:17 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: PROBLEM: boot hang on Indy R4400SC (regression)
Message-ID: <j5uutbx2oi2ccudo54o4hgxfmwfchwmd2ktig6xjgkqa7ho2pj@xb4luighppnc>
References: <g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu>
 <e4ed75c7-b108-437f-b44b-69a9b340c085@app.fastmail.com>
 <ea6p4efuwbrlqjiwkgjcd7ofj7aahfnnvnkooo2il36ggzrlcj@n6mcofpb2jep>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea6p4efuwbrlqjiwkgjcd7ofj7aahfnnvnkooo2il36ggzrlcj@n6mcofpb2jep>

On Fri, Nov 07, 2025 at 03:12:31PM -0500, Nick Bowler wrote:
> On Fri, Nov 07, 2025 at 07:29:25PM +0000, Jiaxun Yang wrote:
> > Unfortunately my Indy won't go over ARCS prom so I'm not in a position
> > to debug this on my side. I have inspected the code again and I can't
> > see anything preventing it to work on R4000 family.
> 
> I'll try adding some extra prints to at least figure out where it is
> actually hanging.

I did not have much success with adding prints, but looking more closely
at the console output it seems that what is ultimately failing is the
SCSI bus enumeration which does not complete unless I revert commit
35ad7e181541.

So I presume that is why I also don't see the messages about mounting
the root filesystem (I suppose it is just waiting for a disk).

I see the drivers printing the usual info about each device, but not
everything.  Specifically, the lines that are missing are all of these
ones that would normally be printed:

    sda: sda1 sda2 sda9 sda11
   sd 0:0:1:0: [sda] Attached SCSI disk

    sdb: sdb1 sdb9 sdb11
   sd 0:0:2:0: [sdb] Attached SCSI disk

   sr 0:0:5:0: Attached scsi CD-ROM sr0

Other than that everything else seems alive.  Several other drivers
go through their initialization during the time the SCSI stuff is not
completing.  The 'random: crng init done' message is printed after a
while too.

I tried enabling CONFIG_SOFTLOCKUP_DETECTOR and CONFIG_WQ_WATCHDOG to
get some more information out but these options do not seem to do
anything in this scenario, nothing is printed even after ~10 minutes.

Thanks,
  Nick
