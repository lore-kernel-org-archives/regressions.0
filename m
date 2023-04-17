Received: from tilde.cafe (tilde.cafe [51.222.161.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1631848
	for <regressions@lists.linux.dev>; Mon, 17 Apr 2023 07:37:58 +0000 (UTC)
Received: from localhost (124.250.94.80.dyn.idknet.com [80.94.250.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by tilde.cafe (Postfix) with ESMTPSA id 12717204E8;
	Mon, 17 Apr 2023 03:37:49 -0400 (EDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Apr 2023 10:37:49 +0300
Subject: Re: [REGRESSION] Asus X541UAK hangs on suspend and poweroff (v6.1.6
 onward)
Cc: <acidbong@tilde.cafe>, <bagasdotme@gmail.com>,
 <linux-acpi@vger.kernel.org>, <regressions@lists.linux.dev>,
 <stable@vger.kernel.org>
From: "Acid Bong" <acidbong@tilde.cafe>
To: <regressions@leemhuis.info>
Message-Id: <CRYTB8JBZ2LK.BAFK0AHDHPNA@bong>
In-Reply-To: <b2edf1ed-2777-03ef-4d5e-e355a6074f78@leemhuis.info>

So, I followed your advice and used the sources (6.3-rc6). Compiled even
two versions: with my config (cf. head letter) and the Arch Linux one
(I'm using Gentoo, but it still fits well), both updated with
`olddefconfig`. Just to make sure that the problem is independent from
the config.

Good news: I experienced the hanging 3 times with both kernels
yesterday.

Two of them were on the custom kernel, and they were of the rare kind -
they occured on shutdown. It goes normally, init disables the services,
unmounts the filesystems, turns off the screen, but then - no response
and the LED and the fan are still on. Another couple of shutdowns went
normal, so the issue it still irregular.

One happened later on the Arch-based one and after a suspend.

/var/log/kern.log showed nothing specific in all cases.

Bad news: it seems, the fix hasn't arrived yet.

How do I proceed next?

--

P.S. On the `pci=3Dnomsi` case: I don't consider it being related to the
issue we're discussing. For me it seems like a hardware issue that can
be bypassed by reconfiguration.
