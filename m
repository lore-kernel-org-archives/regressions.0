Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6A82588
	for <regressions@lists.linux.dev>; Wed,  1 Feb 2023 12:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE86BC433D2;
	Wed,  1 Feb 2023 12:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675255466;
	bh=1YxA1u8MlOPrRvH4KNo29BIw/DFjPlSZKW0yMcJyCEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ft2e22Q91Rw62Pv5gGIV1d1lFgE+Y8AILLUvibdELl3qq6UJoSww6HJ4qFIXTYKPz
	 ubeyEtiv46LVJ5rPZbYq7Y6kdTPcejLaNTwnMUKX27ZKJ13yzFKDLcdriBrYTjlPTV
	 561txRmFP2Vr3PwJU/Z94qlavOcUb81tzDJ8RX9A=
Date: Wed, 1 Feb 2023 13:44:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v1] docs: describe how to quickly build Linux
Message-ID: <Y9pep+GBBaTiN/sN@kroah.com>
References: <fabdb45fa44db2531f0dbe5e88545c49dfb87040.1675252073.git.linux@leemhuis.info>
 <Y9peNbWUR9JmTJbo@kroah.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9peNbWUR9JmTJbo@kroah.com>

On Wed, Feb 01, 2023 at 01:42:29PM +0100, Greg KH wrote:
> On Wed, Feb 01, 2023 at 12:52:30PM +0100, Thorsten Leemhuis wrote:
> > Add a text explaining how to quickly build a kernel, as that's something
> > users will often have to do when they want to report an issue or test
> > proposed fixes. This is a huge and frightening task for quite a few
> > users these days, as many rely on pre-compiled kernels and have never
> > built their own. They find help on quite a few websites explaining the
> > process in various ways, but those howtos often omit important details
> > or make things too hard for the 'quickly build just for testing' case
> > that 'localmodconfig' is really useful for. Hence give users something
> > at hand to guide them, as that makes it easier for them to help with
> > testing, debugging, and fixing the kernel.
> 
> First off, this is great, thanks for doing this.
> 
> One minor comment, to prevent people from "overloading" the
> git.kernel.org systems:
> 
> > +.. _sources_sbs:
> > +
> > + * Retrieve the sources of the Linux version you intend to build; then change
> > +   into the directory holding them, as all further commands in this guide are
> > +   meant to be executed from there.
> > +
> > +   If you plan to only build one particular kernel version, download its source
> > +   archive from https://kernel.org; afterwards extract its content to '~/linux/'
> > +   and change into the directory created during extraction.
> > +
> > +   In most other situations your best choice is to fetch the sources using git::
> > +
> > +          git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git \
> > +            ~/linux/sources
> > +          cd ~/linux/sources/
> 
> Ideally you should never do a "full clone from scratch" like this, as it
> takes up loads of server resources.  The "best" way to do this is to
> download the kernel git bundle, and then pull and resolve the remaining
> bits.  It's explained, with a script to do the work for you, here:
> 
> 	https://kernel.org/best-way-to-do-linux-clones-for-your-ci.html

Oops, here's the full steps involved:
	https://www.kernel.org/cloning-linux-from-a-bundle.html
the first link above has a script that does it all for you, but you
probably just want to copy the steps at this last link instead.

thanks,

greg k-h
