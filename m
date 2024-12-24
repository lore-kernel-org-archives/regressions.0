Received: from srv08.itamservices.de (srv08.itamservices.de [138.201.137.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9984689;
	Tue, 24 Dec 2024 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.201.137.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735050081; cv=none; b=k46zQWMHUHGsLwQqXanatcMwRpDvnl+KjBnB8fsfzB4GrOXuBsxjFZAeZGbe83x/fkN4q/H9IGMbvzI9LDPFDFY02+onLMLEGmw/kt14JODkfEM32Ni15VeuTlhb1kwtJ1lwx83kB03bSAq7E/kLmQm2GBCqoWAAcKptso/4ckc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735050081; c=relaxed/simple;
	bh=U4OtOWjYlj9TIj8aekLr2zRoL8Ndp/kGJ1WXiLbBgc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+GkXHOoBeLR935NEiSqSJBhkZnFl6FZTTGyQiip3vNw358orCy3g35XRROm8c5AAlJ8C8WaQ+JMaj6SiZkTHg/WVkicXudbYqkpfaCQTVly2FV5AFR5tCynJKx1NZcOJRSBk5tF8BciljUd6ZqV0PHJaXTpuomm4VSK+G6kqog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nachtgeist.net; spf=fail smtp.mailfrom=nachtgeist.net; arc=none smtp.client-ip=138.201.137.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nachtgeist.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nachtgeist.net
Received: by srv08.itamservices.de with esmtpsa (TLS1.3:ECDHE_SECP384R1__RSA_PSS_RSAE_SHA384__CHACHA20_POLY1305:256) (Exim 4.96)
	(envelope-from <debian@nachtgeist.net>)
	id 1tQ5mS-001MbP-01;
	Tue, 24 Dec 2024 15:21:04 +0100
Message-ID: <0675b760-c381-4f5e-b587-083b8ace99c4@nachtgeist.net>
Date: Tue, 24 Dec 2024 15:21:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [regression] linux: Loop-mounted UDF ISOs no longer readable
To: Zhao Mengmeng <zhaomengmeng@kylinos.cn>, Jan Kara <jack@suse.cz>,
 sashal@kernel.org, Salvatore Bonaccorso <carnil@debian.org>
Cc: linux-kernel@vger.kernel.org, 1089698@bugs.debian.org,
 regressions@lists.linux.dev
References: <Z2XKY0f6on1UbwWb@eldamar.lan>
 <b681e1ea-bb7d-4d8f-b62c-cae1e4116d21@kylinos.cn>
 <6c8e6c68-b0a1-47b4-82a4-c68490fdc876@kylinos.cn>
Content-Language: de-DE
From: Daniel Reichelt <debian@nachtgeist.net>
In-Reply-To: <6c8e6c68-b0a1-47b4-82a4-c68490fdc876@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Zhao,

> commit 1ea1cd11c72d1405a6b98440a9d5ea82dfa07166
> Author: Jan Kara <jack@suse.cz>
> Date:   Wed Jan 25 11:43:03 2023 +0100
> 
>      udf: Fix directory iteration for longer tail extents
>      
>      When directory's last extent has more that one block and its length is
>      not multiple of a block side, the code wrongly decided to move to the
>      next extent instead of processing the last partial block. This led to
>      directory corruption. Fix the rounding issue.
>      
>      Signed-off-by: Jan Kara <jack@suse.cz>
> 
> diff --git a/fs/udf/directory.c b/fs/udf/directory.c
> index b1424e2aa868..31f1bf8ab848 100644
> --- a/fs/udf/directory.c
> +++ b/fs/udf/directory.c
> @@ -170,7 +170,7 @@ static struct buffer_head *udf_fiiter_bread_blk(struct udf_fileident_iter *iter)
>   static int udf_fiiter_advance_blk(struct udf_fileident_iter *iter)
>   {
>          iter->loffset++;
> -       if (iter->loffset < iter->elen >> iter->dir->i_blkbits)
> +       if (iter->loffset < DIV_ROUND_UP(iter->elen, 1<<iter->dir->i_blkbits))
>                  return 0;
>   
>          iter->loffset = 0;
> 
> 
> In my qemu environment, with v6.1.115 plus this patch, `ls $mntpt/sources` will
> work as normal.
> 
> Jan, I'm not very familiar with this patchset, maybe some more patches needs to
> be backported to solve this problem? I'd love to hear from you.
> 
> Deniel, if it possible, could you cherry-pick this patch to your kernel source
> as a temporary workaround, and test if it really fix your problem? Thanks.

I just tested v6.1.120 +1ea1cd11c72d1405a6b98440a9d5ea82dfa07166 and I 
can confirm that at least `ls $mntpt/sources` gives viable output. 
However, actually running windows setup off a samba share from such a 
$mntpt gives data errors at the very end of windows setup. I guess 
something else is missing...


Thanks!

Daniel
