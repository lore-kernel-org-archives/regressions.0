Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A176FE02
	for <regressions@lists.linux.dev>; Thu, 14 Mar 2024 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710427154; cv=none; b=V61CtzUOz2lW4qrFZLdpAicTXninaLHBuLWjR7qrkEMnx8bXjj5v1//Nu3Z26V5lJoFTsGNTw9UGOiDclKtdAj6ztlj6uVMjnEoyJPFKMjnNwpbOdAbfyYyerHQSW8extwG8WjN5OE81p9/W2gpmvh353H/5GSGGYaz8vlRrXws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710427154; c=relaxed/simple;
	bh=Iyitn/qTh9Xm05kOT4csGXbgCgiQy9MG2KZbnCZIA6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxGXHUcF47JRqFHSc83vBXnFz3w+34fUkqSJoAFJZo8nq20fK+x7xqV1VVCkUZjUTyHisnwuxpRTvG8qBJZSd1yyLMYpWLneWGcx8sD97xrF+X3r8342hl+NFsXCCYyo4h3y1SlhnF7dh/EbpeG+YNx+t5KS9/R3WUldlFlj3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BDUS7Quy; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BDUS7Quy"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E23DD40E0174;
	Thu, 14 Mar 2024 14:39:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rXZ-qIPWRjTq; Thu, 14 Mar 2024 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1710427140; bh=CkyV6JNyQs6Odg06W7LbFbWnDSkx46toEX7TZkdMp80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDUS7QuyU1T6NteH4NBY0ttYeyy2NMACWDL1uS6FGyEq7a9HUUpcTcz2W2rVyjO3D
	 p+TR2/Dvd/jsJQq0YvHiAjW+bmZW9pUY99eZCMHinFg7HpG+o/Xp4lu08R8MK4T2XH
	 3YYgkmuAY19n9JUBtxd3sqdjVXDyoOjlZ2X77E+UgkNc3yQtt3JyqHlvzHG2EzSKkT
	 2CDJj0y2Tk2GUviGu9GFPJROCd8x4zLaHrVXxCFkS224acl4WpGx7eJ3c4Nj/ST13T
	 9iefoDBe1wOUBTOjeGLwY9Wl+CRa/myDDbTYWepNrigGmMZtNVnGXDvU8rDRANaBVf
	 zHBC2PamsEfAAiy77idTXOfsLEAyqNHUIeaKw7rXid0CqnwKepseSup0Co4LeOzWYq
	 m6Itus8SRPeXzqX8XKCmyCOkb3+nOjzV3kte4m1H1jah+RrTk5YxuQgkQKf9PQ9Ixh
	 9Xkxq3LPBGEza+eU9GjUDXHc5mNFhPraECGmwJCrkyfLFvals8RezOP/G2W+/JpFMX
	 NGYOOc8R/so3ub+B/iMS0xOY9r5QC4VtG9A4ALq9Hs9Z7NZpjHz829GXrPOlZpkrxE
	 NXn02A6OaYwGNiFoWwqWHLtEljkTz0lDI1iUmegfrhT6pgKanKI9LvfSts3GwnTwBW
	 4TfZAQoLlg0Tg5+FUvWaUypk=
Received: from zn.tnic (pd953021b.dip0.t-ipconnect.de [217.83.2.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 657A840E0028;
	Thu, 14 Mar 2024 14:38:54 +0000 (UTC)
Date: Thu, 14 Mar 2024 15:38:48 +0100
From: Borislav Petkov <bp@alien8.de>
To: Mahmoud Adam <mngyadam@amazon.com>
Cc: peterz@infradead.org, tglx@linutronix.de, gregkh@linuxfoundation.org,
	regressions@lists.linux.dev, David Kaplan <David.Kaplan@amd.com>
Subject: Re: Regression caused by 'x86/returnthunk: Allow different return
 thunks'
Message-ID: <20240314143848.GAZfML-Bbk3_Nxyc0c@fat_crate.local>
References: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lrkyq5xxrz0gg.fsf@dev-dsk-mngyadam-1c-a2602c62.eu-west-1.amazon.com>

On Tue, Mar 12, 2024 at 08:58:39PM +0100, Mahmoud Adam wrote:
>  We've seen ~35% regression on fio benchamrk on AMD caused by these
> commits:
> `
> 545a94ffc29a4 * x86/alternative: Make custom return thunk unconditional
> b012dcf39d9e7 * Revert "x86/alternative: Make custom return thunk unconditional"
> 1221b8ea25cc8 * x86/returnthunk: Allow different return thunks
> `
> the finding and bisection was done on v6.1, but the regression is
> already seen on the new rebases of other stable kernel 5.10 & 5.15 that
> have the same patches.
> 
> the following exact fio command that sees this regression:
> 
> fio --time_based --name=benchmark --size=50G --runtime=60
> --filename=$device --ioengine=psync --randrepeat=0 --iodepth=1
> --fsync=64 --invalidate=1 --verify=0 --verify_fatal=0 --blocksize=4k
> --group_reporting --rw=randwrite --numjobs=1
> 
> note: the regression is seen even with retbleed=off and also with spectre_v2=off

Say, out of curiosity, how exactly are you running the fio benchmark?

Baremetal, what CPU, kernel, etc?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
