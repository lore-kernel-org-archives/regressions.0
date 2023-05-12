Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3379E39D
	for <regressions@lists.linux.dev>; Fri, 12 May 2023 01:12:55 +0000 (UTC)
Date: Fri, 12 May 2023 01:02:22 +0000
Authentication-Results: mail-41103.protonmail.ch;
	dkim=pass (2048-bit key) header.d=hercules-ci.com header.i=@hercules-ci.com header.b="I92RvO7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hercules-ci.com;
	s=protonmail3; t=1683853360; x=1684112560;
	bh=eW8VYt649iHlSfC7rA85sOfcTbUxdoz43qnBQi+euQs=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=I92RvO7rmW9Owqcp3XwfOfWeAUaxO9tbBuw+hC9Cd0ijPbBpiBc1pI/ooLuz0qM9R
	 oX8opZWoz+I84jfeOJ9OWxR6r1DfMuDeqSMrgkoPaslNsiJ7U7D3+YDULke69D5Y/L
	 emOUvKTaXG4Qb3Tglps6pcNH2gtVIgzcMvPscNcLh2bcFDh1iMB1/jNqEtMaK2N2t9
	 xTB/RYtjAXWJM5H0r5Umwy6gBbekCJc18cY9tFvLpCGaarwG1bGI5KcRfPH8oP3EVW
	 eTJUTSip73c0TJkXnMoX6w+fZmrnrrLueY3Q02VLuEv6Ow1AmZKObOcnzt1OrhmfGc
	 WQDcjELanrBxw==
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>, Snild Dolkow <snild@sony.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, "maple-tree@lists.infradead.org" <maple-tree@lists.infradead.org>, Andrew Morton <akpm@linux-foundation.org>
From: Robert Hensing <robert@hercules-ci.com>
Subject: Re: [Regression] mmap with MAP_32BIT randomly fails since 6.1
Message-ID: <190c5b1b-df67-eb54-1559-706ed4e5719a@hercules-ci.com>
Feedback-ID: 43583703:user:proton
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

It appears that commit 58c5d0d6d522112577c7eeb71d382ea642ed7be4 causes
another regression of allocations with MAP_32BIT.
Reverting it fixes the reproducer from
https://lore.kernel.org/linux-mm/cb8dc31a-fef2-1d09-f133-e9f7b9f9e77a@sony.=
com/

Do you think this commit is somewhat safe to revert?

The following may be superfluous, but adds some context and might help
someone
find this thread. It merely confirms to the observation of this
regression in
https://lore.kernel.org/linux-mm/e6108286ac025c268964a7ead3aab9899f9bc6e9.c=
amel@spotco.us/

 From what I can tell it also fixes my own use case, and

 =C2=A0- The program I maintain,
 =C2=A0=C2=A0 https://github.com/hercules-ci/hercules-ci-agent/issues/514

 =C2=A0- Another program, also Haskell:
 =C2=A0=C2=A0 https://github.com/aristanetworks/nix-serve-ng/issues/27

 =C2=A0- An FPGA interface process. I've found them because they list the s=
ame
 =C2=A0=C2=A0 commit id on their blog.
 =C2=A0=C2=A0 https://jia.je/software/2023/05/06/linux-regression-vivado-en=
/



On 3/2/23 19:43, Liam R. Howlett wrote:
> * Snild Dolkow <snild@sony.com> [230302 10:33]:
>> After upgrading a machine from 5.17.4 to 6.1.12 a couple of weeks ago, I
>> started getting (inconsistent) failures when building Android:
>> While it claims to be using 0x22 (MAP_PRIVATE | MAP_ANONYMOUS) for the
>> flags, it really uses 0x40 (MAP_32BIT) as well, as shown by strace:
>>

The same applies to the dynamic linker in the GHC Haskell runtime system.

It also uses MAP_32BIT, in its linker, and reports the error

ghc: mmap 4096 bytes at (nil): Cannot allocate memory


I hope this was a somewhat useful contribution to the regressions
thread. (also hi, I'm new here)

Cheers,

Robert Hensing


