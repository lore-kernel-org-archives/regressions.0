Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F63FB18
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 19:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tx91dsAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1876C433C7;
	Thu,  5 Oct 2023 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696532442;
	bh=BfwEFJO9Cp+Qg3RT5JBj0Ho1WDLu0QrRBMr1npPITHo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Tx91dsAN+jAj1c964JGg6+BB2bZylJrLCtI+G7yZUKTvm5+qGoHLi7chuz2pKWFCE
	 HK4RORPZWgEK9IlvNYoVxMN0i4Y0gYP0TEdCNAXCzOOyYVo2COkrGaBXv0LXwuVQHI
	 un1Yz/wBm4ZFgm/d9zpNCLQZmHuqwSfq/ZNdeLwHdh4s8AG2q+Xm4NzaASRY2yrlPO
	 SNAEsygpRHdoB2qnNB1mbGNrpaM7XJFBcbEEc/ohTbcQ5kZIi9fOQxJKsS8Ku4P/8k
	 tb8Brr9vVi4/iAFSSf4zArTeAtiIf0WI/XmaX8nKzVdyrZCGE0Nn6W4S7SXctvpJPd
	 Sj6PPz2rq1PiQ==
Date: Thu, 5 Oct 2023 14:00:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kamil Paral <kparal@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
	regressions@lists.linux.dev, bhelgaas@google.com,
	chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20231005190040.GA786747@bhelgaas>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+cBOTdOVnzbXXPhWhWHDs8=n3A1ixcEg6aDVxjCdsneXySdSA@mail.gmail.com>

On Thu, Oct 05, 2023 at 03:01:56PM +0200, Kamil Paral wrote:
> On Thu, Sep 28, 2023 at 5:49 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > Do we know how suspend/resume works with Windows in this
> > configuration?
> 
> Hello Bjorn. I'm not sure if you're asking in general or about my
> laptop in particular. I don't have Windows installed, so I don't have
> an easy way to test this. There used to be some "evaluation" version
> of Windows that I think I could use to test it, but it would be a
> considerable time investment for me (including backing up my data,
> etc), and I'm currently low on spare time. So at this moment I'm
> unfortunately unable to help with this question.

That's fair, thanks!

Bjorn
