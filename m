Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF5A9464
	for <regressions@lists.linux.dev>; Thu,  9 Mar 2023 14:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99BCC433D2;
	Thu,  9 Mar 2023 14:42:02 +0000 (UTC)
Date: Thu, 9 Mar 2023 15:42:00 +0100
From: Greg KH <greg@kroah.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v3] docs: describe how to quickly build a trimmed kernel
Message-ID: <ZAnwONGXWo5V6Wac@kroah.com>
References: <1a788a8e7ba8a2063df08668f565efa832016032.1678021408.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a788a8e7ba8a2063df08668f565efa832016032.1678021408.git.linux@leemhuis.info>

On Sun, Mar 05, 2023 at 02:04:44PM +0100, Thorsten Leemhuis wrote:
> Add a text explaining how to quickly build a kernel, as that's something
> users will often have to do when they want to report an issue or test
> proposed fixes. This is a huge and frightening task for quite a few
> users these days, as many rely on pre-compiled kernels and have never
> built their own. They find help on quite a few websites explaining the
> process in various ways, but those howtos often omit important details
> or make things too hard for the 'quickly build just for testing' case
> that 'localmodconfig' is really useful for. Hence give users something
> at hand to guide them, as that makes it easier for them to help with
> testing, debugging, and fixing the kernel.
> 
> To keep the complexity at bay, the document explicitly focuses on how to
> compile the kernel on commodity distributions running on commodity
> hardware. People that deal with less common distributions or hardware
> will often know their way around already anyway.
> 
> The text describes a few oddities of Arch and Debian that were found by
> the author and a few volunteers that tested the described procedure.
> There are likely more such quirks that need to be covered as well as a
> few things the author will have missed -- but one has to start
> somewhere.
> 
> The document heavily uses anchors and links to them, which makes things
> slightly harder to read in the source form. But the intended target
> audience is way more likely to read rendered versions of this text on
> pages like docs.kernel.org anyway -- and there those anchors and links
> allow easy jumps to the reference section and back, which makes the
> document a lot easier to work with for the intended target audience.
> 
> Aspects relevant for bisection were left out on purpose, as that is a
> related, but in the end different use case. The rough plan is to have a
> second document with a similar style to cover bisection. The idea is to
> reuse a few bits from this document and link quite often to entries in
> the reference section with the help of the anchors in this text.
> 
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
