Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC924C80
	for <regressions@lists.linux.dev>; Wed,  9 Mar 2022 16:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E970CC340EC;
	Wed,  9 Mar 2022 16:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646843726;
	bh=CefiZB93OswAiBg52UlwczG7SfE7iT0HtvRLdyKEJg8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q7H3Gpg2ZJ/IRHwtUfrVnNpZVyQD2YQx+eHVsiQUOwtZM+WZj3reodZWXl78bPMUK
	 y8LMfA5w1DwTlpdCKcevwC0Bpxbuy/5v+zEuKvUrJLPf28hL+YAVXCASRzYLfa0BMD
	 zihNfD/lY3UGybYuXeksIMJUg5Bsnd9dkQX9p2XExoSk7qFf9LrZGv3vdU5KuzAn+C
	 /jwskjoEOner6DRvvXdOMVHls6mmmTo1JdrUNCLLKzhKQS0amVfH4tbFCUt2n9bjpf
	 FeOFqOZxPICEnQKXP0zYV1d+KMPGMBx4bs2vBXTQXXhYZCjquraa2QsTZPVCggCMlt
	 jO/x+9RDBtZvw==
Date: Wed, 9 Mar 2022 08:35:24 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Greg KH
 <gregkh@linuxfoundation.org>
Cc: Manish Chopra <manishc@marvell.com>, netdev@vger.kernel.org,
 aelior@marvell.com, palok@marvell.com, pkushwaha@marvell.com, "David S.
 Miller" <davem@davemloft.net>, stable@vger.kernel.org,
 it+netdev@molgen.mpg.de, Linus Torvalds <torvalds@linux-foundation.org>,
 regressions@lists.linux.dev
Subject: Re: [PATCH v2 net-next 1/2] bnx2x: Utilize firmware 7.13.21.0
Message-ID: <20220309083524.76fa760e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <46f2d9d9-ae7f-b332-ddeb-b59802be2bab@molgen.mpg.de>
References: <20211217165552.746-1-manishc@marvell.com>
	<ea05bcab-fe72-4bc2-3337-460888b2c44e@molgen.mpg.de>
	<46f2d9d9-ae7f-b332-ddeb-b59802be2bab@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Mar 2022 17:18:30 +0100 Paul Menzel wrote:
> > This change was added to Linux in commit b7a49f73059f (bnx2x: Utilize 
> > firmware 7.13.21.0) [1] to Linux v5.17-rc1, and backported to the stable 
> > series, for example, Linux v5.10.95.

SMH, I must have missed this getting backported in the rush of merge
window backports :(

Yes, please revert.
