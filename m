Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A5D3B4E84
	for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327793; cv=none; b=awI/6sN7EwHqJuDgj5XUv0K22PTdLIo9WdIj1+lATGA0LVcpGDc9NvY3yWEVccDhTo8ZG1oUEyJRwCWWujTrCjFYrE7E+foYBLBPu48KXKI/btY8DrJ/wvgSf3S8oVhOsXucdycOjIT3ZNCFevT8Ma7ZH/rervHD91j4Ixe/E5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327793; c=relaxed/simple;
	bh=gLc30Z+9vOBzkAprgy+ZzWzCvuoZOmSPjY+GSFBC7K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsADpAcR50lQL6ESSak918Dw+TsnwKJO+4Xjyclr1gvzyDQYqB2PqSA8Wu7Acwn2xBGXXOzNFbQuPdy56YEGYxwwYBfRmjQAIcmsSgZLQG8hz9fZIyrsuSckVrOw8QC4fUNTS57Y/iP/uxvWefzu7s1kWrgAbrP4AsCKtmdJJes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X6Ka0WVm; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X6Ka0WVm"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a725a14e3so10196321fa.0
        for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773327789; x=1773932589; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w3Z0IgmvA6IrttCl9VcQbxLY4PbNB0saZqQGQHabijM=;
        b=X6Ka0WVmI///IheyeCnPLIUItgtTBY5irtR654LjcsX8twH7cxhTWcGnqKJjaWr/IC
         BGM3PvhbUIIQ8srRr5IwkuwtQqPJSSKhqwryE8EZrvgEuXOve3rQR2NRu1WSJUiX/Nny
         KKSBRtWYP63C+fSzasJA8H1/9FLQkgDZFth7ZLa0oD/eLrzrb3mU86/6U/ijUJPkfece
         jmCOWhLqnHJ/8eQ3Aa9tMKzRglwydLP5h6Mczw2TxEoXWfDz+TFd81JqDpbshXoOvZEB
         dIU8N8VjOILZAH3XdajQ/vREfI+0ei8UNYUOeIP5J3SXcW59/jgYdVMWi7eOow7/22dN
         nKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773327789; x=1773932589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3Z0IgmvA6IrttCl9VcQbxLY4PbNB0saZqQGQHabijM=;
        b=w3rAE2Z99CeqFlFsAvTTdavii9qf5Fgj5qPOovvZBdy6cbaFPCEbLSbtoBNbhhJjMd
         lKzYzqH2gEKLVMIsSZmKkvbpeg647eY3Vh5VJpsS/CYjonp7cEYZ8cCtCblbvLaTA2H5
         XbRpptcM/4pZ0embUZQpqXUy/VQBTxkVQdHmx+s3bQEyVGXBsEIYHVyxu+efDtG79Gkn
         qmJqkIzTnAnEzZx+UUWBmejqvylD7Fr3Wu+h7Xwbj6MKGxiR/q6FPx+Bcof11EMlpEk/
         /O2K4HZr9la7LGAmKKrJHsHuL9H5TjZD36kjrFtZYbtKXMMmUHEmi0gYfhRL8/HKgr+e
         AyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFMyKqLxgokHomqLLYgKR1y8E6cUwLhV/Kwn0jtkIOtY9ewVxLbJl7InpC5EEmBDFYl2ZiTzNFZMRe6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIjtHlMJfsICiLahqzOOh8RAPXyqhEQnhgkvSgChZg55Qb6Oko
	oQ50xupe8ZH+Bjl+t+YuTNCfJWnjWN2+HeuJEjPnuIgbnQY/pbiwdqexNgxxTwZ81+JvfNjs6mH
	eyhKC
X-Gm-Gg: ATEYQzyYPgXw9JBK3dOowRnlEyPm4NurDDAXvUQr7AnKe897YcqAfgGVq9F1lTKbBOt
	xTI0IoLztDeyCbQjlzt545GuMRnKz1SkMhgRzv8pnwsdwHnElzaEGzF8f0WiKRB8x/uqVXlboKn
	43spt1xc/rGtFaF81Z7O0Fo30iBH/inZQq6PhIl4YJDcxlzcJBfs+J/Kga3n1DRYxUQTWEbqZBQ
	jJKE66WP3tD1UXTSntzAqgPZhuC7rUr1P/jbJ6pLWwZBuCg6CSEP7/xDZrDB0b175Jzp+QuZO4D
	9YuIOHII7x9PnMAUctAW3knY7CDFcbzls1RZhyYHVQfXKsC+SNOWcJh1zxYOPA+tCATXn+OeFPc
	e/ocSR3Nv+GCdO6qwTMtlsN8rXWz7UD+7QAVNXjdVj2pvm6enBlW2jq6wAecMuIn6tSwznzBQ0e
	PqB3Bmv3PtQVyOes8J1y9QV3SWwzWO8ib86uD8h0sHfHs1PQbdc75stiQ=
X-Received: by 2002:a05:651c:2102:b0:38a:45f8:6270 with SMTP id 38308e7fff4ca-38a67e1aa9cmr23403431fa.21.1773327787720;
        Thu, 12 Mar 2026 08:03:07 -0700 (PDT)
Received: from precision.tail0b5424.ts.net ([2804:7f0:6402:b103:6a0a:3e1c:778a:5cc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa7492dsm6507324eec.29.2026.03.12.08.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:03:06 -0700 (PDT)
Date: Thu, 12 Mar 2026 12:03:01 -0300
From: Henrique Carvalho <henrique.carvalho@suse.com>
To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: "Dr. Thomas Orgis" <thomas.orgis@uni-hamburg.de>, 
	Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [REGRESSION] failure to reconnect on SMB server restart with
 custom TCP port (not 445): Host is down (at least since 6.6.95)
Message-ID: <42utcrhajix2x3feckj7ap373osq65sgfz6ximnaj4rasszret@ymhf44ddz2wh>
References: <20260310235642.6d9798f4@plasteblaster>
 <c66p7dr6vlujvnwczbnrmqx7monkdgdnm4rwewm76aibn7jza3@d3uik74dei72>
 <CANT5p=q2Lv4pSvEm5EWcM73b7NZsbt1kYEFJtjaAZRS6Gz_OjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANT5p=q2Lv4pSvEm5EWcM73b7NZsbt1kYEFJtjaAZRS6Gz_OjQ@mail.gmail.com>

On Thu, Mar 12, 2026 at 05:44:58AM +0530, Shyam Prasad N wrote:
> On Wed, Mar 11, 2026 at 7:37 AM Henrique Carvalho
> <henrique.carvalho@suse.com> wrote:
> >
> > On Tue, Mar 10, 2026 at 11:56:42PM +0100, Dr. Thomas Orgis wrote:
> > > Dear Linux-CIFS maintainer(s),
> > >
> > > I stumbled upon a regression in the Linux cifs/smb3 client when working
> > > with a smbd using a non-standard port. I am not the first to note this, see
> > >
> > >       https://bbs.archlinux.org/viewtopic.php?id=306712
> > >
> > > which is a report from mid last year, indicating the problem sometime
> > > after Linux 6.6.72. It is a very simple issue, where details of the
> > > kernel builds or mount setup don't seem to matter much: Older kernels
> > > reconnect to a SMB server that was restarted (old processes killed and
> > > replaced), newer kernels do not and just have a defunct mount.
> > >
> > > I reproduced this in our HPC cluster environment with such smb.conf on
> > > the server side
> > >
> > > [global]
> > > security = user
> > > map to guest = Bad Password
> > > server role = standalone server
> > > smb ports = 1445
> > >
> > > [public]
> > > path = /some/path
> > > guest ok = yes
> > > read only = yes
> > >
> > > and such a mount command on the client:
> > >
> > > mount -t smb3 -o port=1445,user=guest,password=foo //server/public dir
> > >
> > > When I kill and re-start smbd on the server, older client kernels
> > > reconnect and continue to return listings and files from the share,
> > > while newer kernels give this:
> > >
> >
> > My suspicion is that the regression was introduced by:
> >
> >     5713127da855 ("cifs: update dstaddr whenever channel iface is updated")
> >
> > That change causes parse_server_interfaces() -- should this be running
> > without multichannel mount option? -- to overwrite the port stored in
> > server->dstaddr with CIFS_PORT.
> >
> > The attached patch preserves the existing port from server->dstaddr.
> >
> > Note that I have not yet tested this patch or confirmed the regression
> > with a bisect. If you can't, I will try to do that tomorrow.
> >
> > --
> > Henrique
> > SUSE Labs
> 
> Hi Henrique,
> 
> AFAIK, the ignoring of port from the results was by design and part of
> the original code back in 2018:
> CIFS: parse and store info on iface queries
> 
> Also, the comment in the code just above says why this is so.
> [MS-SMB2] 2.2.32.5.1.1 Clients MUST ignore these
> 
> I checked this section and it says:
> Port (2 bytes): This field MUST NOT be used and MUST be reserved. The
> server SHOULD set this field to zero, and the client MUST ignore it on
> receipt.
> 
> Based on the conversations here, it looks like smbd ignores this.
> 
> I think the right fix would be to make sure that
> cifs_chan_update_iface gets called only for secondary channels. That
> way, it will not get called for single channel scenarios.

Sure, I read the comment in the code and the MS-SMB2 protocol. The
protocol states that "client MUST ignore [Port] on receipt". Since we
are not using p->Port, I don'se see how this is a protocol violation.

We're using the port that was selected on mount and copied over to
server->dstaddr, so that when server->dstaddr is overwridden,
server->dstaddr keeps the user selected port.

Now, even if we only fix that for primary channels, the secondary
channels will still get the wrong port when they are overwridden, no? So
I don't see how that fixes the issue.

Apologies if I'm missing something.

Best regards,

-- 
Henrique
SUSE Labs
