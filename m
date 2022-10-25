Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE6EDA
	for <regressions@lists.linux.dev>; Tue, 25 Oct 2022 12:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBC0C433D6;
	Tue, 25 Oct 2022 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666701457;
	bh=5PsLnS67Su3bPOrJCspzFfoWK4Xe2eqkMNclBtSM6uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2ZApffJHQde9YV7oOTNdNRuRM2gpK4rZu8bYJslyB2IUfE4+zSMw9G7Fh2xgZr6PO
	 jTPI2iCN+0hIGAqx9G95Syga9e9Lp7wr5SorrjSbgFDVOqU7xBwVGVAhg5HaExNBhU
	 X7hU0XA/e5WTYOuioWihxo/VB8zxQc0m9Q3fbm5s=
Date: Tue, 25 Oct 2022 14:37:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian Bach <christian.bach@scs.ch>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: tcpci module in Kernel 5.15.74 with PTN5110 not working correctly
Message-ID: <Y1fYjmtQZa53dPfR@kroah.com>
References: <ZR0P278MB0773545F02B32FAF648F968AEB319@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>
 <ZR0P278MB0773072DD153BA902AFE635AEB319@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR0P278MB0773072DD153BA902AFE635AEB319@ZR0P278MB0773.CHEP278.PROD.OUTLOOK.COM>

On Tue, Oct 25, 2022 at 12:19:39PM +0000, Christian Bach wrote:
> Hello
> 
> For a few weeks now I am trying to make the PTN5110 chip work with the new Kernel 5.15.74. The same hardware setup was working with the 4.19.72 Kernel. The steps I took so far are as follows:

That is a huge jump.  Why not use 'git bisect'?

Or start with a smaller jump.  Why not go to 5.4.y first, that's only a
year's worth of changes, instead of 4 years of changes.

thanks,

greg k-h
