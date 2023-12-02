Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E79A4418
	for <regressions@lists.linux.dev>; Sat,  2 Dec 2023 23:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SjQSZ12GLz4x5j;
	Sun,  3 Dec 2023 10:02:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>, npiggin <npiggin@gmail.com>, christophe leroy <christophe.leroy@csgroup.eu>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Timothy Pearson <tpearson@raptorengineering.com>
In-Reply-To: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec register save
Message-Id: <170155803785.146803.11553342425486262629.b4-ty@ellerman.id.au>
Date: Sun, 03 Dec 2023 10:00:37 +1100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Sun, 19 Nov 2023 09:18:02 -0600, Timothy Pearson wrote:
> During floating point and vector save to thread data fr0/vs0 are clobbered
> by the FPSCR/VSCR store routine.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Don't clobber fr0/vs0 during fp|altivec register save
      https://git.kernel.org/powerpc/c/5e1d824f9a283cbf90f25241b66d1f69adb3835b

cheers
