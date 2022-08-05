Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8F9A3D
	for <regressions@lists.linux.dev>; Fri,  5 Aug 2022 04:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DA7C433D7;
	Fri,  5 Aug 2022 04:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659674846;
	bh=FmKwzAx6tYuW/PdvvLxIOtwxLkZ7VwpD8hSB3GYZixo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otZQ93y5SaMclvsXAAgys3YaI16GRHsa37lmr1hKJ7EkIi2ggKCoKvhEKIILBqGpo
	 kc5eNWaa+UPjT/Ic3xOhAvTfzH1t/Hv4ZRtK9j5ZvTHh3UNgvhn1Md5hntKd13iq/b
	 X/JAiZT7YjYZdxATP4d/hMKurlHt+grfbjCvxlME=
Date: Fri, 5 Aug 2022 06:47:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: dmkgrim80 <dmkgrim80@gmail.com>
Cc: linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
	gregory.greenman@intel.com
Subject: Re: intel ax200 problem after iwlwifi source change from 5.6 to
 5.7,current
Message-ID: <Yuyg2nYP0HrwKwUO@kroah.com>
References: <8155d519-8ae3-6fb2-ca44-552541b3fedf@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8155d519-8ae3-6fb2-ca44-552541b3fedf@gmail.com>

On Thu, Aug 04, 2022 at 11:47:27AM -0500, dmkgrim80 wrote:
> Hello I have a issue I would like resolved
> 
> 
>            Hi, I have a intel AX200 m.2 installed in a old Acer Aspire E15
> E5-553-11PT
> 
> I am having some issues with kernels newer than 5.4 and possibly 5.6.

If you can not use 'git bisect', it's going to be difficult to narrow
this down to the offending commit.

Please try to use that, and also remember that you can use 'make
localmodconfig' to reduce your configuration file size so you don't end
up building kernels with all options in it to reduce your build times.

good luck!

greg k-h
