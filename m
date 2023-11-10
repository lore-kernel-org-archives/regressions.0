Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02581C3A
	for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raptorengineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=raptorengineering.com header.i=@raptorengineering.com header.b="r0Us1hp/"
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 166D882854A9;
	Thu,  9 Nov 2023 22:35:12 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Zvunt07DcreF; Thu,  9 Nov 2023 22:35:10 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id BFE8482854BC;
	Thu,  9 Nov 2023 22:35:10 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BFE8482854BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1699590910; bh=Kr6ClNIve0X6u41iQWYOWy8F3vDjar+Q3cud5R+sqt0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=r0Us1hp/cQdGNbz+X0PpDcL1OzGY9Rdqwcqqbu/kxjxUrOXH/lPQGtOAINZQefkzt
	 FsZwJKsahz8y5+SneknEvvGjeT7uHrbBQQ8KvUmk1WGwQAEUcAL5hDIDKb7wwU0lZu
	 QEGL9yp2P0jFtCn0t0X9C0GIZ2pAnqTXMdSlS7ng=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fr4G0qHq45qA; Thu,  9 Nov 2023 22:35:10 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 77F6F82854A9;
	Thu,  9 Nov 2023 22:35:10 -0600 (CST)
Date: Thu, 9 Nov 2023 22:35:08 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: regressions <regressions@lists.linux.dev>, 
	Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <1475520442.46161385.1699590908294.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <a29fcb47-de03-46a7-b4d1-47a6c9a28879@kernel.dk>
References: <480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com> <e3e1b31f-a9a0-4387-982e-aba6d9763c6b@kernel.dk> <1926532589.46050149.1699551411577.JavaMail.zimbra@raptorengineeringinc.com> <a262a91e-f2ec-402f-ba40-adacb76c72b9@kernel.dk> <871420600.46050861.1699551732591.JavaMail.zimbra@raptorengineeringinc.com> <99f43fc0-a500-41b5-9575-33a57d0795de@kernel.dk> <9867b2be9c0845f9f2e3a16f91f40574.squirrel@vali.starlink.edu> <a29fcb47-de03-46a7-b4d1-47a6c9a28879@kernel.dk>
Subject: Re: Regression in io_uring, leading to data corruption
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: Regression in io_uring, leading to data corruption
Thread-Index: 9biFCZe6aG2A7Wl/Csk9gvXK3P7LPg==



----- Original Message -----
> From: "Jens Axboe" <axboe@kernel.dk>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "regressions" <regressions@lists.linux.dev>, "Pavel Begunkov" <asml.silence@gmail.com>
> Sent: Thursday, November 9, 2023 9:51:09 PM
> Subject: Re: Regression in io_uring, leading to data corruption

> Just to go back to basics, can you try this one? It'll do the exact same
> retry that io-wq is doing, just from the same task itself. If this
> fails, then something core is wrong. I don't think it will, or we'd see
> this on other platforms too of course. If this works, then it validates
> that it's some oddity on ppc with punting this operation to a thread off
> this main task.
> 
> diff --git a/io_uring/rw.c b/io_uring/rw.c
> index 64390d4e20c1..1d760570df04 100644
> --- a/io_uring/rw.c
> +++ b/io_uring/rw.c
> @@ -968,7 +968,7 @@ int io_read_mshot(struct io_kiocb *req, unsigned int
> issue_flags)
> 	return IOU_OK;
> }
> 
> -int io_write(struct io_kiocb *req, unsigned int issue_flags)
> +static int __io_write(struct io_kiocb *req, unsigned int issue_flags)
> {
> 	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
> 	struct io_rw_state __s, *s = &__s;
> @@ -1092,6 +1092,19 @@ int io_write(struct io_kiocb *req, unsigned int
> issue_flags)
> 	return ret;
> }
> 
> +int io_write(struct io_kiocb *req, unsigned int issue_flags)
> +{
> +	int ret;
> +
> +	ret = __io_write(req, issue_flags);
> +	if (ret != -EAGAIN)
> +		return ret;
> +
> +	ret = __io_write(req, issue_flags & ~IO_URING_F_NONBLOCK);
> +	WARN_ON_ONCE(ret == -EAGAIN);
> +	return ret;
> +}
> +
> void io_rw_fail(struct io_kiocb *req)
> {
> 	int res;
> 

That does indeed "fix" the corruption issue.

Where is the punting actually taking place?  I can see at least one location but if it's a general issue with the punting process I should probably apply any test mitigations to all locations, and I'm not familiar enough with the codebase to be sure I've got them all...

Thanks!
