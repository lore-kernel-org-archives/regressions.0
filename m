Received: from tilde.cafe (tilde.cafe [51.222.161.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705963D4
	for <regressions@lists.linux.dev>; Fri,  9 Jun 2023 11:16:08 +0000 (UTC)
Received: from localhost (67.250.94.80.dyn.idknet.com [80.94.250.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by tilde.cafe (Postfix) with ESMTPSA id CA44020309;
	Fri,  9 Jun 2023 07:09:18 -0400 (EDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jun 2023 14:09:17 +0300
Subject: Re: [REGRESSION] Asus X541UAK hangs on suspend and poweroff (v6.1.6
 onward)
Cc: <bagasdotme@gmail.com>, <linux-acpi@vger.kernel.org>,
 <rafael@kernel.org>, <regressions@leemhuis.info>,
 <regressions@lists.linux.dev>, <stable@vger.kernel.org>,
 <helgaas@kernel.org>
From: "Acid Bong" <acidbong@tilde.cafe>
To: <acidbong@tilde.cafe>
Message-Id: <CT81XH8HT8A1.2XAHQ1IF5VSO9@bong>
X-Mailer: aerc 0.15.2-0-gf1772c92f92e
In-Reply-To: <CSB8TSV6LXJ8.7SHI9VM2YMAR@bong>

Hi there, hello.

This seems to be my final update.

About a week ago I returned to using Gajim, which, as I remember from
earlier, also seemed to be responsible for these hangings, and they got
more frequent (I haven't updated any software for the last 2 months). I
decided to move to the kernel version 6.1.1, which I earlier marked as
"good", and my laptop hung last evening during the shutdown. As always,
nothing in the logs.

I tried to compile some versions from 5.15.y branch, but either I had a
bad luck, or the commits weren't properly compatible with GCC 12 yet,
but they (.48 and .78) emitted warnings, so I never used them (or I
broke the repo, who knows).

Due to the fact that software does have impact on this behaviour, and
due to my health issues and potential conscription (cuz our army doesn't
care about health), which will cut me from my laptop for a long-long
time, I give up on bisecting. I'll just update all my software (there's
also a GCC upgrade in the repos) and hope for the best.

Sorry for inconvenience and have a great day. Thank you very much.
