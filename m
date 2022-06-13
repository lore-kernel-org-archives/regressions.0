Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155551364
	for <regressions@lists.linux.dev>; Mon, 13 Jun 2022 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=74UX7MWPYAaIblRMnIERw/k0jzzIxCFbAdKIQkmHh8I=; b=Z7AyPWON+EVR26AMxKjCiZ1zRp
	so/WmMmBjYRf1iowFiQ+fN7Y3ZMMl6YEFFlsIpKbwEfUNYBwuoPAu7qr77415PyebY7OPdQCOozQ5
	VoAAEh0zdR63YjNnpmf4S3jIws/U5ZCUUC9Gsc89dAC4T3V8uJdIvkMMJSDpUrBSwgRBX2u1gJdYH
	x1QMfwp6kX19tCHRWYKjPXsGcsqysfdj9ocgSC1DBWcbvnGqGSd8Df84U3ZCBIOnx75Fwmllyo8hf
	fJOXqCRkqnU0SXXu9S2o9njpnrQyzdxg6fa5deOqmQzkrS3vaqeCGNqGui79DPjiJqzMAk/e86KjE
	Agc/xT0A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32846)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1o0hzJ-0001g6-4V; Mon, 13 Jun 2022 12:12:05 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1o0hzG-0006VI-8u; Mon, 13 Jun 2022 12:12:02 +0100
Date: Mon, 13 Jun 2022 12:12:02 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Shubham Bansal <illusionist.neo@gmail.com>, bpf@vger.kernel.org,
	jpalus@fastmail.com, regressions@lists.linux.dev,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [BUG] null pointer dereference when loading bpf_preload on
 Raspberry Pi
Message-ID: <YqcbgmTmezGM0VPr@shell.armlinux.org.uk>
References: <f038d6f9-b96b-0749-111c-33ac8939a1c0@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f038d6f9-b96b-0749-111c-33ac8939a1c0@i2se.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Jun 13, 2022 at 12:22:47AM +0200, Stefan Wahren wrote:
> It would be nice to get a hint, how to narrow down or which commit might
> trigger this issue.

The standard way? git bisect?

So it happens on 5.18.0 and 5.18.3. Presumably it didn't happen with
5.17?

I've tried to trace the code but failed - skel_map_create() doesn't seem
to feature anywhere obvious in my kernels.

It looks to me like some BPF code is being loaded by the bpf_reload
module and is being run. I'm guessing that the BPF code is calling
bpf_sys_bpf, but as I can't find skel_map_create() that's all it is,
a guess.

It looks like copy_from_bpfptr() which calls copy_from_sockptr_offset()
is passing in a source pointer of 0x0048. I'm guessing this is the value
of the pointer that is passed into bpf_sys_bpf() - that's another guess,
there's no information on that in the backtraces.

So, there's really not much to go on here to debug the oops as the
kernel has printed... I'd say its pretty much undebuggable from just
the kernel oops.

Maybe someone on the bpf list will have a better idea.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
