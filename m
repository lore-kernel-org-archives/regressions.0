Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E271FB3D7
	for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 18:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729537083; cv=none; b=PLUjCWcC1Lo9KLPBcFI9zX7QeftnTfSF9ePe/mx7n5Mb0h1Q9u0mi0fqf3rdxtljuot/re0QBH97S7koW2Cysl0ZCn3dELoE9KfzfwScbFf0mni4ZEUW5AStIhIaoivpDQoEto00H76qrFAbR/iStWaSVsXgdtUeUZT+t7gc3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729537083; c=relaxed/simple;
	bh=PysUGtBPrSuesGgmYr6bDEcVlC+Z3tHnHKdsXTKbTwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2RpDp3V1o0dnzlPSD2UklCqXmRQvoRI4hv8X6ocgjK1vPWEL/86l1WHgxcMRW1wCKd23vzq0cQTQfK9pYLbglJFjwWuNmamRBb2xhyP1oBRQMiQgr8a7K+PGz80hsmU+VxqJm/180K8yhTyQSbUZwwJE5VgVs53gD3KAYPpFWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WamoiQ26; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WamoiQ26"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f2b95775so5660528e87.1
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 11:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729537077; x=1730141877; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LTRV3bBQxzuWsx6RapAOc7MDWRhOKcayDBqasSrcjC0=;
        b=WamoiQ26RRXttsk2YXD+s6nsV7fqLsJeVvqFS0ngkmc3YpS6tUrHiEGW/5dYY6LEGn
         uw7fX7W6u3HTZrcDoHVnrUVeygekhIIRKfskwUB4+FF3A7nLBTObHw1qux8JQbo9Q2mH
         6WCkbyTYSM2tB7zVg6fPP/kpc5HrtIX5cQf4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729537077; x=1730141877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTRV3bBQxzuWsx6RapAOc7MDWRhOKcayDBqasSrcjC0=;
        b=EU0d5Fm7slixpSzWh1Bb68ukMsrr1uTVfSVah7+miiwvO7lnUfyjJRK7W9Nschz4zE
         86Ur6XLkMnGZy1e893tgeNkF4GGrQ7GhvlXUwz1pzquS7N+NTPb0Q1S60pk1K/5LDjkX
         t8VJlYwktHFHHoojhXWSZLK8xfV85yd4rhjIWBDV4JR9VHdq804nsUibFgI+3lXIYzb4
         VqXG15BDrTCtmaxsgw1kSewWdg36ZZGClPe/8xDiWMuKG4FSQdospxBkZq6Y8ZUtg2Lj
         +dnMUKURafvKHsgJQt0KrGy80r5cOiBwD9TnkHzrZbF3mrpqU8OKyU0Dn6Tip0adx9Oz
         Ry1w==
X-Forwarded-Encrypted: i=1; AJvYcCVwRsjqiEkE7RkenkFIOTDi+Jc3A8Vk7OeaK3GFueYDVnJFzayr/3rjohGe2zrAj3yhlh7kLn7l3zhx3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7OBxZnRisaNSA6YojO4sqybwVBnMVhlWZowY99j/+H++YIuET
	TFze6Bd+ijAuceySVB1VvU9nVhxzqddxUDHjeJk4oG7xPBupiGzizA1WopgUE80T4gFbb5UmtKh
	maUBKrw==
X-Google-Smtp-Source: AGHT+IFkHjSedbWSwZR8un02emQ9seNpgPzWJAHCNPP7fNWJUerZd4gle/CwzzJDhwLBIpmPg/bL6g==
X-Received: by 2002:a05:6512:39cb:b0:538:9e36:7b6a with SMTP id 2adb3069b0e04-53a15494e4emr10001044e87.32.1729537077041;
        Mon, 21 Oct 2024 11:57:57 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223efb0csm544493e87.64.2024.10.21.11.57.55
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 11:57:56 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539fb49c64aso6762545e87.0
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 11:57:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaCPpbKrsMdSUuvSZye5QKFkXvCG7pJLXzMO5LPYXH7v73aXDQnvoTfeuTB1M+x+dRfdvOzr0NgaXnIg==@lists.linux.dev
X-Received: by 2002:a05:6512:3b20:b0:539:901c:e2e with SMTP id
 2adb3069b0e04-53a154eb6famr10642034e87.58.1729537074916; Mon, 21 Oct 2024
 11:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240807094725.2193423-1-pedro.falcato@gmail.com>
 <20241018172804.GA2151929@nvidia.com> <CAKbZUD0Z_Kyumx3ourywUYhfksGNgJWrCpjAdnxtsbwS4vMRkA@mail.gmail.com>
 <1cb07628-269c-4d6c-9936-f3a2b233165f@leemhuis.info> <b6852c2d-3371-47a4-bfeb-049f4048e88a@suse.cz>
 <ZxL3FsmjGrTT_EV9@codewreck.org> <d937fd92-249e-4660-a59a-ee85b6ec4691@suse.cz>
 <ZxafcO8KWMlXaeWE@telecaster.dhcp.thefacebook.com>
In-Reply-To: <ZxafcO8KWMlXaeWE@telecaster.dhcp.thefacebook.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Oct 2024 11:57:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpxeTifM1LFPQFR5_RjD2uvDAHbZ-ATCqox+RuFwkbDQ@mail.gmail.com>
Message-ID: <CAHk-=wjpxeTifM1LFPQFR5_RjD2uvDAHbZ-ATCqox+RuFwkbDQ@mail.gmail.com>
Subject: Re: [PATCH] 9p: Avoid creating multiple slab caches with the same name
To: Omar Sandoval <osandov@osandov.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Dominique Martinet <asmadeus@codewreck.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Eric Van Hensbergen <ericvh@kernel.org>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, v9fs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Jason Gunthorpe <jgg@nvidia.com>, Pedro Falcato <pedro.falcato@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 11:37, Omar Sandoval <osandov@osandov.com> wrote:
>
> FYI, drgn's CI started getting EIO errors from
> getdents("/sys/kernel/slab") that I bisected to this patch. The problem
> is that dev_name can be an arbitrary string. In my case, it is
> "/dev/root". This trips verify_dirent_name(), which fails if a filename
> contains a slash.

Bah. Does something silly like this fix it:

  --- a/net/9p/client.c
  +++ b/net/9p/client.c
  @@ -977,6 +977,7 @@ static int p9_client_version(struct p9_client *c)
   struct p9_client *p9_client_create(const char *dev_name, char *options)
   {
        int err;
  +     static atomic_t seqno = ATOMIC_INIT(0);
        struct p9_client *clnt;
        char *client_id;
        char *cache_name;
  @@ -1036,7 +1037,8 @@ struct p9_client *p9_client_create(const char
*dev_name, char *options)
        if (err)
                goto close_trans;

  -     cache_name = kasprintf(GFP_KERNEL, "9p-fcall-cache-%s", dev_name);
  +     cache_name = kasprintf(GFP_KERNEL,
  +             "9p-fcall-cache-%d", atomic_inc_return(&seqno));
        if (!cache_name) {
                err = -ENOMEM;
                goto close_trans;

(whitespace-damaged, but you get the idea)

                  Linus
