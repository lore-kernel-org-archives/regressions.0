Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C71E9F9
	for <regressions@lists.linux.dev>; Wed,  2 Nov 2022 16:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9FBC433D6;
	Wed,  2 Nov 2022 16:39:24 +0000 (UTC)
Date: Wed, 2 Nov 2022 12:39:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: postix@posteo.eu
Cc: 20221031144850.5522b036@rorschach.local.home,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, tiwai@suse.de
Subject: Re: [REGRESSION 6.0.x / 6.1.x] NULL dereferencing at tracing
Message-ID: <20221102123922.790e72bd@rorschach.local.home>
In-Reply-To: <1c8c03ab-9aa1-d059-11ad-9cafbb0478c5@posteo.de>
References: <e693eb6b-28d0-d091-3df3-60f2b591c0e7@posteo.de>
	<71829e56-a13f-0462-37a7-a4d64c16f561@posteo.de>
	<25d7e982-f959-d86c-a6e7-5efd1db1e75c@posteo.de>
	<20221102120338.254741f7@rorschach.local.home>
	<1c8c03ab-9aa1-d059-11ad-9cafbb0478c5@posteo.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  2 Nov 2022 16:36:29 +0000
postix@posteo.eu wrote:

> On 02.11.22 17:03, Steven Rostedt wrote:
>  > Could you add this patch.
>  >
>  > https://lore.kernel.org/all/20221101191009.1e7378c8@rorschach.local.home/  
> 
> 
> Thanks, this patch fixes the issue for me! Please see the final dmesg 
> output [1].
> 
> [1] https://paste.opensuse.org/e8d4fa46
> 

Yes that's known too. rasdaemon needs to be updated to use the
libtracefs library, which should fix all this.

-- Steve
