Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F468
	for <regressions@lists.linux.dev>; Thu,  2 Dec 2021 06:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A76C53FCC;
	Thu,  2 Dec 2021 06:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638427299;
	bh=N6s8uyXaMMbHTbaRzaIZf1iqKMVGcdcuwE2QAnSJP/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1edUzoosLnLNB5sm67pQrYuNM4Ra5WTtE6YDOHP/Fn8dG7nIk4Dz8fcYVVnUMec+M
	 5fOnktik/v6hXjPN16lvDO9XJFdXN9y9YKfyLgZpSYFh6U+YAhNDolL8Ou//5Ywd1M
	 GYMoTE4fgmnhodSJfECMg2sZopMtU1p9vAFnUfhg=
Date: Thu, 2 Dec 2021 07:41:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: roots@gmx.de, kuba@kernel.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] igc: Avoid possible deadlock during suspend/resume
Message-ID: <YahqnvgmT63iG48E@kroah.com>
References: <87r1awtdx3.fsf@intel.com>
 <20211201185731.236130-1-vinicius.gomes@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201185731.236130-1-vinicius.gomes@intel.com>

On Wed, Dec 01, 2021 at 10:57:31AM -0800, Vinicius Costa Gomes wrote:
> Inspired by:
> https://bugzilla.kernel.org/show_bug.cgi?id=215129
> 

This changelog does not say anything at all, sorry.  Please explain what
is happening here as the kernel documentation asks you to.

> Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
> ---
> Just to see if it's indeed the same problem as the bug report above.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
