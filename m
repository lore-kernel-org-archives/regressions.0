Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0007CAD54
	for <regressions@lists.linux.dev>; Fri,  9 Jun 2023 08:04:30 +0000 (UTC)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0D55D4A2;
	Fri,  9 Jun 2023 07:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0D55D4A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1686297191; bh=9D0R5T6cmhBfx5S7xPGN5oChCgWg2uNoNNcTmG2sYEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bj67Wu2MLD5+LqIXRXeq6EGEUGSYhgTEleur7PHs4IQbJ5xePlBArWhb1sW0OQsP/
	 QYTIC22gchpn64WRHult7VGG3FUMZxSLH9uC3hO4n9aflBqXwLotvQP1midMYVLB+e
	 ry1hICpjAnyw37AMEPbO+VlLSUJcjJI/IELlOtgFxEPKSySJWXNHwOf3FlymUxSmBB
	 NE0WLxEZegDBCveMTsTH6nbQ+Mn1ZiHikL4RGRrJ6OQAPA27PuUzu7dYmDECNzlvaW
	 Nwl/0LB/J7vdbyHPZy+g/B8hY3XDfRr2xaGgoAKKnwzHTF3GvYwcXpfQgGtJbdUsrc
	 6NdSWK/vY+OsA==
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v1] docs: handling-regressions: rework section about
 fixing procedures
In-Reply-To: <6971680941a5b7b9cb0c2839c75b5cc4ddb2d162.1684139586.git.linux@leemhuis.info>
References: <6971680941a5b7b9cb0c2839c75b5cc4ddb2d162.1684139586.git.linux@leemhuis.info>
Date: Fri, 09 Jun 2023 01:53:07 -0600
Message-ID: <87pm65oyvw.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> This basically rewrites the 'Prioritize work on fixing regressions'
> section of Documentation/process/handling-regressions.rst for various
> reasons. Among them: some things were too demanding, some didn't align
> well with the usual workflows, and some apparently were not clear enough
> -- and of course a few things were missing that would be good to have in
> there.

Applied, thanks.

jon
