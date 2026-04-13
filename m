Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815B32142B
	for <regressions@lists.linux.dev>; Mon, 13 Apr 2026 11:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080125; cv=none; b=jdADF9QxXkTTuh3IjoOr1E7VWdY/jShcyKKphyijSNz92uECNg04Nx2Of4z1nthuW/xfsgIEXRBdI0Zdq//Ibltzc/49d7i2Z7uPea0YPNKtyO4sTQUdVxwvq6PPHqebxVsuvOJ3X5klJ7ZdZPf0Si3tWAvC4mqUMY/itc7d5mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080125; c=relaxed/simple;
	bh=NkCG5dNKR/7tGXgar7zGy+QPPRGsKbzTG4E+VZxW6kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/ZeYDbFYcYVXOkRLfUAvLKxb92ZtE5Fxz4T6h38i/iRFOiIyJlKJHB9iafePZhxN4eTSSFl0ri6qoMps36Uso6svsqhri8smXB+WXBF0sfAsMKhuzHC2zor5EdJ/k9YlNlN1dpeSbo/UW15PoJPDmzn0SnHrXbwjH8yv+II5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gSeLmkcQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gSeLmkcQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso45689685e9.1
        for <regressions@lists.linux.dev>; Mon, 13 Apr 2026 04:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776080122; x=1776684922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4lt6lkZuAvrUzCTFC1yOHD1wDn40gr5BAHBhSXGovSE=;
        b=gSeLmkcQDHdt8iErGmNgj5P2rtP+QUV129N0vOKjLrCHxPqSHX8a7e2S+Km4hAF2Lb
         FA7Lj0jk4UtDAX1O/mUpjgE6pm/eAYq9pqQl6C3bxNxME1vf48NqpalFb99Huk+bCK+q
         /sBT+v3Y+OA/1Tw/fI4FJSfPLMe+j1Xq34iMPAgtKSVySZ5NWf6ux5ssdyCUr5jiESrV
         OmdbNbObPCapqlBDfFDzK76U0IJlciJ/jqz0hc1E6+MwT4Cqthhxsh0kcx9T9d8P9gvs
         MPcSL5Ni9DE8vDJhZZ1a3/lWTNa/zH22+HVuiXHC9J6agp/kkX3dZnJ0APwoHmUKSrTv
         HHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080122; x=1776684922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lt6lkZuAvrUzCTFC1yOHD1wDn40gr5BAHBhSXGovSE=;
        b=GkB56AlLVGRUwPZ1fZ5Zjx9n7F//HYbMt/aIydr5JmYTY0hnvpEkVHMMx4Zd2f6HNA
         OKeDQ+EIFBuD4QjDNDHOd35zSUBHCJqCKhOVpvzIMoTJHqm4gSEGFzNXolcQ+A9ZgKx7
         Yq4fDaYbk1Pgxyp76exDJQrdJz4pPqXy4VQXfUNWwRtnE1TnwkHMQccalCvQ9FyPL+pf
         FM2nVB+o7cejnsL6KYtDI6hM7p0H4hPCoI9YYcUw8pTKr097FxpeM+egMllMNuI8ryQ6
         Xr8XpGXltufrC6S8KbRXIeTXk6Lnn580vi97GiOpB4NPa8f6PvWZrNFQo0ECXRFI8q5M
         It+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+GRsR/C4FnYNic8+yT400dNzuKm9oNdV3GL2DhoPK3PCsaK2aoe+8au9v8QfGlJsa05pgFGtmNBbt6Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLnhojXRjPNxgMcS1ukIKrcioDRf/23b9hc1pFyWjJXh3+ged9
	L3Y+DN/AcSos2j2M9/Uk72AqZ9MoAoGuHDykcgsH/laJGiB1/9iBFAvCd3DW4WLyHdw=
X-Gm-Gg: AeBDiev1QbAqZ9MtERWDVtbWfw2ANxEcfATm9KacsaaZxkDx7+29bwn9hl7np7rGzG/
	LCKNowyhQTUujOb2T+D1+CwOXR3lj3CPN5amirH1PRgrQs/lHnKDzVfNiC0jE8orMPAL2712UCp
	YEMV0lvtwPKpKbDgHzB/WvYnrWAAoMcuofwyfrdDlPTwMVqgrVDNIV7Kvpm5zoX8ujk4cnbbNjs
	O3Vuq9CG0KZmxCRhPqD8pBJByq312zh3QMXj517BHv/p03TqXYJe3yv0S/zF1esan+ZRj3HOQAi
	zhRMtPVh2HDhEaADt8eIl0mWzcc80R6d4zE3zrAYs8TbJjz8+4X7NoeIXCQ+uIYUNTTq/Pd6oh6
	G1IIYoB7H3KF8NU7ELkOBuXJ9HlS+NH2n3pjpD1owHfR9B3Tl+bc3OjKUz+4e0/dHexyZzjB+J3
	24Sn6odC4x4wMlgsnhxDpbUAfqXQFvf4U=
X-Received: by 2002:a7b:cd05:0:b0:488:a9c3:44a3 with SMTP id 5b1f17b1804b1-488cd4f463dmr164345755e9.2.1776080122044;
        Mon, 13 Apr 2026 04:35:22 -0700 (PDT)
Received: from precision ([2804:7f0:6401:5290:433e:afae:f475:c9f7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa586bsm18631266eec.11.2026.04.13.04.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:35:21 -0700 (PDT)
Date: Mon, 13 Apr 2026 08:35:15 -0300
From: Henrique Carvalho <henrique.carvalho@suse.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, 
	"Dr. Thomas Orgis" <thomas.orgis@uni-hamburg.de>, Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [REGRESSION] failure to reconnect on SMB server restart with
 custom TCP port (not 445): Host is down (at least since 6.6.95)
Message-ID: <xsj62z4aad54cseq4ug2cpj3x3tqjucjxkgv2c45lihhc54l5r@wjmkrz3q4r5m>
References: <20260310235642.6d9798f4@plasteblaster>
 <c66p7dr6vlujvnwczbnrmqx7monkdgdnm4rwewm76aibn7jza3@d3uik74dei72>
 <CANT5p=q2Lv4pSvEm5EWcM73b7NZsbt1kYEFJtjaAZRS6Gz_OjQ@mail.gmail.com>
 <42utcrhajix2x3feckj7ap373osq65sgfz6ximnaj4rasszret@ymhf44ddz2wh>
 <e21c9e47-36e2-4f15-a7a5-af239a0abb89@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e21c9e47-36e2-4f15-a7a5-af239a0abb89@leemhuis.info>

On Mon, Apr 13, 2026 at 01:16:03PM +0200, Thorsten Leemhuis wrote:
> On 3/12/26 16:03, Henrique Carvalho wrote:
> >
> > Sure, I read the comment in the code and the MS-SMB2 protocol. The
> > protocol states that "client MUST ignore [Port] on receipt". Since we
> > are not using p->Port, I don'se see how this is a protocol violation.
> > 
> > We're using the port that was selected on mount and copied over to
> > server->dstaddr, so that when server->dstaddr is overwridden,
> > server->dstaddr keeps the user selected port.
> > 
> > Now, even if we only fix that for primary channels, the secondary
> > channels will still get the wrong port when they are overwridden, no? So
> > I don't see how that fixes the issue.
> > 
> > Apologies if I'm missing something.
> 
> Lo! What happened to this? I saw that Henrique posted "smb: client:
> preserve destination port when parsing server interfaces" a month ago at
> https://lore.kernel.org/all/20260311160856.635916-1-henrique.carvalho@suse.com/
> which looks like a fix[1] for this regression, but unless I'm missing

That patch was updated. PATCH v3 was the one that made to the tree.

See commit d4c7210d2f3ea481a6481f03040a64d9077a6172 ("smb: client: fix
iface port assignment in parse_server_interfaces").

Best,

-- 
Henrique
SUSE Labs
