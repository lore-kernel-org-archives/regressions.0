Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF657E
	for <regressions@lists.linux.dev>; Sat,  4 Mar 2023 16:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA241C433EF;
	Sat,  4 Mar 2023 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677947394;
	bh=umcemy53qtUEgWpL2tTKrKeIQakV5HeE4WLED07PO+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mS+8Z8zjABOax/2EbhHpD4lwOdmcWbCa6y/lSdraiS//az2rzVbsPzlwsSv7BGeAe
	 noOE0NBCPi6W0ZOzerfUqyyXio269QYLxScv06Gdg29EtMcJWI5VsCa1x882ZcxyR1
	 Llswzjs98WoMdC/MvpgCwrmIKMaJVy3iteS4AaQE=
Date: Sat, 4 Mar 2023 17:29:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Laurent Lyaudet <laurent.lyaudet@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Too many BDL entries regression
Message-ID: <ZANx/xXokp2ju4Uw@kroah.com>
References: <CAB1LBmv1kY+kuUBWvXRoe+mbQBjtJOFvZB8Smmbcuy2MdvgJnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB1LBmv1kY+kuUBWvXRoe+mbQBjtJOFvZB8Smmbcuy2MdvgJnA@mail.gmail.com>

On Sat, Mar 04, 2023 at 04:41:23PM +0100, Laurent Lyaudet wrote:
> Hello,
> 
> Thanks for your hard work :)
> Ubuntu 22.10 shipped kernel 5.19.0-35 thursday.

There's not much we can do about this old and obsolete kernel version,
sorry.  Please work with your distro to resolve it.

If you use a kernel.org release, we will be glad to help you out, as you
point out, that is much newer as can be seen on the front page of
www.kernel.org

thanks!

greg k-h
