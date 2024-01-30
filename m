Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D87866A
	for <regressions@lists.linux.dev>; Tue, 30 Jan 2024 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706654638; cv=none; b=FKaSY+H2PTp5h+NeT3K6NNfhJUGDf2fZ/6EJ3G/W0GyTsaYZX0YbzjZlAfpJ7aCXQ8iuQm5qozpiqwisMlAZof55oAkJ8Twdikuyuo27YtpwvZJUnRfaywCe7Vrzi+MQNik8P24BNmuOnn2+DhHyx8sJFrUDZUtXIY/ibDzl39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706654638; c=relaxed/simple;
	bh=JsQhwuGrZMtViDvxvJKfJkvE2n8Ybw7wD1zinEFujmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDhL7FB0WnzXHzw8YAKLZaSJBX2jGCwWu/aiiQu+TxPmXtP7UafZ8TdzgJXnyNQ6+zCh4PcNzBSHpwCBhxm17xo8tsOKgPuaiSbNwCb1Zy07nEVrUY3dwRzU6CZTka4ylv/JiHKAVFzu8cmQhR93n9OZjxmHHik4Q8efC4jw8oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4l/5viI; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4l/5viI"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3604697d63so271539966b.3
        for <regressions@lists.linux.dev>; Tue, 30 Jan 2024 14:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706654635; x=1707259435; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRDK+Smf4I0g9+6IXWqW+oV9u9CZnWJjpwATTXUI1t0=;
        b=h4l/5viIGM8mhwHxwba/WM8GcT6EE4eT6IOjlmCOAto/QoR880Omnoh1oTUAzruWVw
         Fbd7eblA4nd3GDJOmVgDexM+LaXYESURYTryl8SuAUaL4+vqQp+le+HgAfUJZ/I0JMek
         IWFGRI20AAcbPWf5qplPeZjkwndDxEzJ7o8xC6mJdhgy78OYcMO+dUClIPgPXH/YIO8M
         CZyGLkwGXe6Wf+HrVA2Tng59PPiWcHFKDhDluTbQI8l5zEGc5wdyqGtZiMAP1KumXbls
         6YBSHTXOTDnyoD8EBnLMnA+niyutJ4Smir6CGWNNBbV3Sc7j7yNtXRixA+Oi5SXsfU0h
         yn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706654635; x=1707259435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRDK+Smf4I0g9+6IXWqW+oV9u9CZnWJjpwATTXUI1t0=;
        b=gaCbqiQodJMj75rxrnpyVC2BqcHU6fd9rzzFtIHip41KFYxTS/pARu4ASfvIH7w5Tz
         nNn+ERrqR/bULQ4x1YMxsQzwdxuTzQ4vZn/IVzxuZ381uQ8NwLK82eFY9KKnsLRg2xe/
         kEh3wOPQcPDtqmP8jiHTg/cwVmTGQQd+iCI8O+TWl8vndmN4wEVGbN/5ZOIjnYtxzrgX
         oVv7u7cDHPuSAYBldhZ6j3/N6ZRL9d+7MW8JdINPGrh0V7+6CkfsefvmZwa6LSoeupEQ
         8ZH2gBJgKYFiwt0oRHjsAJCs2kCxckaL2mq6WMk1U06eZJk0Eswy143PuYB+shVvhcuL
         D06Q==
X-Gm-Message-State: AOJu0YxGcjdQG1h2kYDPqra7luoUPGAHt+0NUBkaga806Ucx5k6auMTu
	FaqguKv8Y2YQazzrtX22LL8hyAfi8n4kSSj/kjvVwECbBiNcRoS10ysQTla0Ny4=
X-Google-Smtp-Source: AGHT+IF+RaRMKzBQZlFwM6GHJmfferHLON2cUoM1E2WHuZ6IZDm7V++xNRPxts7v/4Go0Wog5nmWPg==
X-Received: by 2002:a17:906:46d9:b0:a36:63d6:1861 with SMTP id k25-20020a17090646d900b00a3663d61861mr354282ejs.35.1706654635067;
        Tue, 30 Jan 2024 14:43:55 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id vu2-20020a170907a64200b00a35a9745910sm3015892ejc.137.2024.01.30.14.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 14:43:53 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 1C74CBE2DE0; Tue, 30 Jan 2024 23:43:52 +0100 (CET)
Date: Tue, 30 Jan 2024 23:43:52 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Paulo Alcantara <pc@manguebit.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>,
	Leonardo Brondani Schenkel <leonardo@schenkel.net>,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	Mathias =?iso-8859-1?Q?Wei=DFbach?= <m.weissbach@info-gate.de>
Subject: Re: [REGRESSION 6.1.70] system calls with CIFS mounts failing with
 "Resource temporarily unavailable"
Message-ID: <Zbl7qIcpekgPmLDP@eldamar.lan>
References: <8ad7c20e-0645-40f3-96e6-75257b4bd31a@schenkel.net>
 <7425b05a-d9a1-4c06-89a2-575504e132c3@sairon.cz>
 <446860c571d0699ed664175262a9e84b@manguebit.com>
 <2024010846-hefty-program-09c0@gregkh>
 <88a9efbd0718039e6214fd23978250d1@manguebit.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88a9efbd0718039e6214fd23978250d1@manguebit.com>

Hi Paulo, hi Greg,

Note this is about the 5.10.y backports of the cifs issue, were system
calls fail with "Resource temporarily unavailable".

On Mon, Jan 08, 2024 at 12:58:49PM -0300, Paulo Alcantara wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > Why can't we just include eb3e28c1e89b ("smb3: Replace smb2pdu 1-element
> > arrays with flex-arrays") to resolve this?
> 
> Yep, this is the right way to go.
> 
> > I've queued it up now.
> 
> Thanks!

Is the underlying issue by picking the three commits:

3080ea5553cc ("stddef: Introduce DECLARE_FLEX_ARRAY() helper")
eb3e28c1e89b ("smb3: Replace smb2pdu 1-element arrays with flex-arrays")

and the last commit in linux-stable-rc for 5.10.y:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit?id=a280ecca48beb40ca6c0fc20dd5a7fdd9b3ee0b7

really fixing the issue?

Since we need to release a new update in Debian, I picked those three
for testing on top of the 5.10.209-1 and while testing explicitly a
cifs mount, I still get:

statfs(".", 0x7ffd809d5a70)             = -1 EAGAIN (Resource temporarily unavailable)

The same happens if I build
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit?id=a280ecca48beb40ca6c0fc20dd5a7fdd9b3ee0b7
(knowing that it is not yet ready for review).

I'm slight confused as a280ecca48be ("cifs: fix off-by-one in
SMB2_query_info_init()") says in the commit message:

[...]
	v5.10.y doesn't have

        eb3e28c1e89b ("smb3: Replace smb2pdu 1-element arrays with flex-arrays")

	and the commit does
[...]

and in meanwhile though the eb3e28c1e89b was picked (in a backported
version). As 6.1.75-rc2 itself does not show the same problem, might
there be a prerequisite missing in the backports for 5.10.y or a
backport being wrong?

Regards,
Salvatore
