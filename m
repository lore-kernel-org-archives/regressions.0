Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B463A7
	for <regressions@lists.linux.dev>; Thu,  9 Mar 2023 10:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC005C433D2;
	Thu,  9 Mar 2023 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678357330;
	bh=evv28xiKYzjwZQ9COm/b53ivkKvoKDN2Zn8yRRg/VWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEhvdGGi+dWBjEpCtFVVFxxl8fxfFQ1SOHRlu8UV0P5watjNgKqf2NpL+g2TUmUxS
	 rP6KKigKohBYp7GHVt8TqQYJdFpsKqAYU8T/Vua8zpE5X9WLaUS+/AaC/LwlW2N4ah
	 CYHnNsrr6sTUtXhjY3RPjXIKPt2ojbUFceKemTo4=
Date: Thu, 9 Mar 2023 11:22:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sylvain Menu <sylvain.menu@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	chuck.lever@oracle.com, jlayton@kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: nfs mount disappears due to inode revalidate failure
Message-ID: <ZAmzT/D8YxJ3844j@kroah.com>
References: <CACH9xG8-tEtWstUVmD9eZFEEAqx-E8Gs14wDL+=uNtBK=-KJvQ@mail.gmail.com>
 <ZAmv57xeNqs7v9hY@kroah.com>
 <CACH9xG9=BFszD9OXspttTFdki0e68b5Hw7o11AUQ7pptSMy9wQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACH9xG9=BFszD9OXspttTFdki0e68b5Hw7o11AUQ7pptSMy9wQ@mail.gmail.com>

On Thu, Mar 09, 2023 at 11:17:30AM +0100, Sylvain Menu wrote:
> I think it's a regression according to the old resolved bugs/tickets
> but no idea since when it's broken again

Any chance you can do 'git bisect' to find where it broke and what
commit broke it?

thanks,

greg k-h
