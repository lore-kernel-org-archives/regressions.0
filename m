Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6DA33DF
	for <regressions@lists.linux.dev>; Sat, 22 Oct 2022 22:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF06C433D6;
	Sat, 22 Oct 2022 22:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1666479388;
	bh=D4mNyNda84fJ6pyLtCt0adu0b4qEGwhmimfAIHqFxlA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PaC332JbxNVIDT5Uw0lssHRULYKuAk0g1YhQ41wPTKJUDSP29TKzI8s1fZYvg3MEv
	 Y4WWkIBVWSi8UXiPYPOw6cSCRd8RUIvexB7v9corh/oI8v3H9qRMgynEg8Q0ERbJ3p
	 eny3WIFAmSvzSVbu/Fzbj5uVmi4Cnjf0KjDzvTNA=
Date: Sat, 22 Oct 2022 15:56:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: Phillip Lougher <phillip@squashfs.org.uk>, linux-kernel@vger.kernel.org,
 hsinyi@chromium.org, regressions@leemhuis.info,
 regressions@lists.linux.dev, dimitri.ledkov@canonical.com,
 michael.vogt@canonical.com, phillip.lougher@gmail.com, ogra@ubuntu.com,
 olivier.tilloy@canonical.com, Marc Miltenberger
 <marcmiltenberger@gmail.com>
Subject: Re: [0/3] squashfs: fix some regressions introduced in the
 readahead code
Message-Id: <20221022155627.be13b4ea9769f76818e73f81@linux-foundation.org>
In-Reply-To: <4493e774-ff23-e2a1-4aa7-28b190eb909d@alu.unizg.hr>
References: <20221020223616.7571-1-phillip@squashfs.org.uk>
	<4493e774-ff23-e2a1-4aa7-28b190eb909d@alu.unizg.hr>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Oct 2022 03:38:01 +0200 Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr> wrote:

> Please consider crediting Marc Miltenberger, who was first to reproduce 
> and confirm that the
> bug was not in my build but in mainline kernel.

Thanks, Marc.  I've added your Reported-by: to my copies of the
three patches.
