Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB33010949
	for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 01:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713835331; cv=none; b=b9yVoy68noG6nXxiGnV3+9dW5UiyVh1QuCzpsKOY6ThcoO+acfs80iDfh0WBM5RZgP1cskK2TJcGcGKIiHdRq7iXwci+lmxIIWque1+60/p3xzW7a3gVgmFDJxVqTLdk7yngG+7mqnI4OJXvblWZTo6jtzm3C9Q7D5SC7oKqvEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713835331; c=relaxed/simple;
	bh=Ih5x3U7p/xtVraTTykRD3OsOwljk9aCuZMTsbHhk8XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxHbNtd3xOPe/tZrkAQP1hzQ2ynbmbtk4jw/d2fViXUd+kcWxHhf1UPjL/WLzUfHtOmZU1OYIQjvjkBssOBRmg6kAGCtccecMvpspZrHQewt0itr9tdCr4eCsIu62hI5fTd0nyp61iVcNeHy123lODtEMmj6UpHQkI1nzX1Be2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=Bo7a/SmO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Bo7a/SmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1164C32783
	for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 01:22:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Bo7a/SmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1713835327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ABtPQ8N241McwH5nBg097+oC8v9+e969bZpbfxdAxJg=;
	b=Bo7a/SmOoG+JYtN0U12s/KdN/K9YPwQO2U7Df3gj0Zy0tHf6yaZ6wf0tUpHaTLTCcWR56o
	2OzydvBrH6TDAOiEJWmz5+SMktEDm21j0O4sXlWNKK9nOENQPpkg7FhCGaulIQ4kTQz6RX
	ckK8y7h3bZBaw+sVwH8zHvzLGsbsTKg=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2969f3f5 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Tue, 23 Apr 2024 01:22:06 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so3836956276.1
        for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 18:22:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKyl7YyGtbstWHE9WXdS/Y8HLWr658N+tnQMcAy2E+Q7I8LfcWXo82ZJaOQ5FiIDInmt1zx5kgdviu28LIKPE4zsKuX9UoEvXdqd0=
X-Gm-Message-State: AOJu0Yw9sbkMcgvH5pxJllSLpwtTW9JO/7cMlUoEvzPkdcKMcJs2wta+
	MHVNFDtNHafYyfAK6I6PexhWCd3/hvAgP5Gusv719BiPA80HlThBoRpFln4CK76+mqHERo8xckR
	RKyMZ/D/8qBSE6NUKePMwin2exNI=
X-Google-Smtp-Source: AGHT+IHOl/OU0gcvKAzZv+BDUZWeDYaENpYzgHuuBDp9zvpkL5AsnDGHxy57Vi8y+7xvNvjifG8fxHcls0zCXYzjLQs=
X-Received: by 2002:a25:ac90:0:b0:dc6:d258:c694 with SMTP id
 x16-20020a25ac90000000b00dc6d258c694mr1437897ybi.19.1713835324219; Mon, 22
 Apr 2024 18:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240418114814.24601-1-Jason@zx2c4.com> <e09ce9fd-14cb-47aa-a22d-d295e466fbb4@amazon.com>
In-Reply-To: <e09ce9fd-14cb-47aa-a22d-d295e466fbb4@amazon.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 23 Apr 2024 03:21:52 +0200
X-Gmail-Original-Message-ID: <CAHmME9qKFraYWmzD9zKCd4oaMg6FyQGP5pL9bzZP4QuqV1O_Qw@mail.gmail.com>
Message-ID: <CAHmME9qKFraYWmzD9zKCd4oaMg6FyQGP5pL9bzZP4QuqV1O_Qw@mail.gmail.com>
Subject: Re: [REGRESSION] Re: [PATCH] Revert "vmgenid: emit uevent when
 VMGENID updates"
To: Alexander Graf <graf@amazon.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Lennart Poettering <mzxreary@0pointer.de>, Babis Chalios <bchalios@amazon.es>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Cali, Marco" <xmarcalx@amazon.co.uk>, Arnd Bergmann <arnd@arndb.de>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, Christian Brauner <brauner@kernel.org>, linux@leemhuis.info, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

The process here seems weirdly aggressive and sneaky.

On 2023-06-19, I wrote that I didn't want to take this route for
userspace notifications.

Then on 2023-06-28, you wrote to Greg asking him to take it instead of
me. Nine minutes later, Greg said "yea sure." Then he caught up on the
thread and some hours later wrote:

> Wait, no, I'm not the maintainer of this, Jason is.  And he already
> rejected it (and based on the changelog text, I would too), so why are
> you asking me a month later to take this?
>
> Work with the maintainer please, don't try to route around them, you
> both know better than this.

Then on 2023-11-14 you wrote to me again asking me to take it, despite
my earlier reservations not changing in the interim. I didn't have a
chance to reply.

Then on 2023-11-30, Greg weirdly took it anyway, with zero discussion
or evidence on the mailing list as to what had happened.

When I noticed what had happened (while working on his driver in the
process of cleaning up/reworking patches that your Amazon employees
sent me that needed work), suspicious that you tried to "route around"
the proper way of getting this done and trick Greg again into taking a
patch that's not his purview, I asked him wtf happened on IRC:

<gregkh> ugh, sorry, I don't remember that.  I think Alexander talked
to me at plumbers and said, "hey, please take this virt patch"
<gregkh> but you are right, you NAKed it in that thread, I forgot
that, sorry.  Yes, revert it if that's needed.

Greg then ACK'd the revert commit which came with a stable@ marking
and a Fixes: tag (for 6.8, which isn't very old).

So it looks to me like you twice tried to trick Greg into taking this,
succeeded the second time, got caught, and now are trying to make a
regression argument as a means of keeping your sneaky commit in there.
All of this really _really_ rubs me the wrong way, I have to say.

I don't know what holds more weight here -- the predictable regression
argument, or the fact that you snuck nack'd changes into a very very
recent kernel that can still be removed while probably only affecting
you. But I'm obviously not happy about this.

Jason
