Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CD915DBD6
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719861430; cv=none; b=GnjHgqKajcoJJT6bM3fnCiaYnmVKWC8s4I7Xfsnj6p4VzsDuRWzoAouH07SzfjwnJWSCCMgiG4Rx4MdrPAyIpTUe+wst4BqMVw201BgqMBPBVTMNBLMfwT4JKO44wnPd3i57fEKGVkHHQCKNsxqV3elmjpceAw6j/oWoGnqavQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719861430; c=relaxed/simple;
	bh=AoIVWqz91vGUZX9FKk7V1op2U0B1NwvcnbHXWJ2o/hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnaCC5ZaB90nfXN1WPoF/ZyDIaGfYroQ+Rw9FwqeB6Qbs4a3K1C2nCgMi2IY6hqfSW/JkyoUJn02PSTVjd18/WtFopAie687cUtoXB5zdEEAswlI7rSODiobEbr40DCijxJn6jlNtmxuFms/Y+M8lwOvn8Zw3vQGzo6dEtx0Yas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pqIrUluP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqIrUluP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C46C116B1;
	Mon,  1 Jul 2024 19:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719861430;
	bh=AoIVWqz91vGUZX9FKk7V1op2U0B1NwvcnbHXWJ2o/hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqIrUluPT1UWvLnTu/ofCqje3KgpSshEKH9YTxfcWjGsQ+FoRqrgxOrRpxSLzMP5J
	 L4khWZbRPjZ+FeAKj0pECCvq31wUkU8i2ehljZ4Iy9hhd6+XD3Nq8f6oe6I0xHU6SK
	 UcoeABhitIIdh3of4qz2O51iy19/bAkRVvigTjJu9G1zKXiBkDlliZnhjdTm/PxINC
	 iCzTOhIuStvjPuteabc7pKksDQV+rCsesd5nzuBcNngH0frRhqhxzHAKHE7Mp51LGe
	 Jjr3vH0v9RnDqSu4n1Ah+neOubmPEHxt/u/KSICVB2jUcto9xe3iDsW4tzEGtpPg3h
	 l2ZtoN69K6nkQ==
Date: Mon, 1 Jul 2024 12:17:10 -0700
From: Kees Cook <kees@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Yanjun Yang <yangyj.ee@gmail.com>, linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, rmk+kernel@armlinux.org.uk,
	Ard Biesheuvel <ardb@kernel.org>, akpm@linux-foundation.org,
	ben@decadent.org.uk, Wang Kefeng <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] ARM: Remove address checking for MMUless devices
Message-ID: <202407011216.E1DCF4BF@keescook>
References: <20240611100947.32241-1-yangyj.ee@gmail.com>
 <CAE8JAfxkbw4+wsKjoH1qyo1r69TpgLtfRjchTJ=4vVvvM46CuA@mail.gmail.com>
 <6767f6e1-f7b7-4b3e-8173-32f1472f56d6@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6767f6e1-f7b7-4b3e-8173-32f1472f56d6@leemhuis.info>

On Mon, Jul 01, 2024 at 01:54:21PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 12.06.24 03:25, Yanjun Yang wrote:
> > Apologies for not CCing the relevant maintainers in my previous email.
> > 
> > On Tue, Jun 11, 2024 at 6:09 PM Yanjun Yang <yangyj.ee@gmail.com> wrote:
> >>
> >> Commit 169f9102f9198b ("ARM: 9350/1: fault:
> >> Implement copy_from_kernel_nofault_allowed()") added the function to check
> >> address before use. However, for devices without MMU, addr > TASK_SIZE
> >> will always fail.  This patch move this function after the #ifdef
> >> CONFIG_MMU statement.
> 
> What happened to this fix regression for a 6.9 regression? From here it
> looks like it fell through the cracks, but I might be missing something.

This patch can be sent through rmk's ARM patch tracker, but if it's
urgent, I could take it via my tree? It has Ard's Ack.

-- 
Kees Cook
