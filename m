Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1B7F6
	for <regressions@lists.linux.dev>; Mon, 20 Jun 2022 08:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943E3C3411B;
	Mon, 20 Jun 2022 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655715306;
	bh=Dlx46ibDOjW0ve1IpwJyEmnqQ3sB8sQEricE+hL20YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OV2eQeJT5UK6XBKXnHWW9LhWRYUVkquFy96kUHgLED1buvAZSDKuNLLIdS89pdDBr
	 fvQZ2uw/89O8HfdCzeGryHVxjVt4f0pP8PZNM0SM66uxy/W5VqU/rz2DdQZwNpYeJI
	 kY4j/ibE9gNw+1LpakFT22Lf4m73L04r51M972+w=
Date: Mon, 20 Jun 2022 10:55:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ernesto Vigano' <lanciadelsole@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	o.rempel@pengutronix.de
Subject: Re: Fwd: question on driver for phy dp83td510e
Message-ID: <YrA150NSJzFszEpB@kroah.com>
References: <CAM3i8OEGrux+ku7hL20oGO10f=CDLkpcg3wH6hRbheEdacWnfw@mail.gmail.com>
 <CAM3i8OF1mC21wzwfsvhQTK7PPa0myCwftyhA9U1r7HR_0Q3fLQ@mail.gmail.com>
 <CAM3i8OFjvOkLGELkrKEo3B7x0hP=uPrYaPL05=0WXygvYJNZCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM3i8OFjvOkLGELkrKEo3B7x0hP=uPrYaPL05=0WXygvYJNZCQ@mail.gmail.com>

On Mon, Jun 20, 2022 at 10:45:59AM +0200, Ernesto Vigano' wrote:
> I see that some weeks ago a driver for phy dp83td510e from TI
> (https://www.ti.com/product/DP83TD510E).
> I see that it's really different from the Linux driver supplied by TI
> on its official repo
> https://git.ti.com/gitweb?p=ti-analog-linux-kernel/dmurphy-analog.git;a=commit;h=fefa908e4e3262455a0cec08f3bb7161d7792d02
> As an example, TI writes some undocumented register for version 1.0 of the PHY.
> 
> Should I forget about the TI driver?
> Or is there something that should be integrated in
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/dp83td510.c

Why not ask on the proper mailing list and also ask the TI developers
about why they are not submitting their changes upstream to us?

This has nothing to do with the stable or regressions list, sorry.

good luck!

greg k-h
