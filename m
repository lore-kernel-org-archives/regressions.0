Received: from tilde.cafe (tilde.cafe [51.222.161.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117108C05
	for <regressions@lists.linux.dev>; Mon,  1 May 2023 21:10:13 +0000 (UTC)
Received: from localhost (124.250.94.80.dyn.idknet.com [80.94.250.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by tilde.cafe (Postfix) with ESMTPSA id 835DC20584;
	Mon,  1 May 2023 17:02:27 -0400 (EDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 May 2023 00:02:26 +0300
Message-Id: <CSB8TSV6LXJ8.7SHI9VM2YMAR@bong>
Cc: <stable@vger.kernel.org>, <linux-acpi@vger.kernel.org>, "Thorsten
 Leemhuis" <regressions@leemhuis.info>, "Rafael J. Wysocki"
 <rafael@kernel.org>
From: "Acid Bong" <acidbong@tilde.cafe>
To: "Bagas Sanjaya" <bagasdotme@gmail.com>, <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Asus X541UAK hangs on suspend and poweroff (v6.1.6
 onward)
X-Mailer: aerc 0.14.0-126-g6d59ad3f02bc
References: <CRVU11I7JJWF.367PSO4YAQQEI@bong>
 <5f445dab-a152-bcaa-4462-1665998c3e2e@gmail.com>
 <ZE+1pKbfy1l/tTo6@debian.me>
In-Reply-To: <ZE+1pKbfy1l/tTo6@debian.me>

Hi there, and thank you for the reminder.

Bisecting, unfortunately, takes a long time: I'm only trying out the 7th
commit, 15e7433e1dc2 (previous 6 marked as bad). The bug, as noted in
the head, doesn't have any (strict) patterns and takes randomly long
times: some kernels hung on the next day after compilation, one took 5
days. I'm not excluding a possibility that I might've got the versions
wrong and the bug occured on the update from 6.1-pf1 to 6.1-pf2 (6.1 and
6.1.3; could be unrelated, but I saw a bunch of commits related to i915
and Skylake).

I also checked my package manager log, no programs related to kernel
compilation (glibc, gcc, archivers and such) were updated until I
updated to the problematic version, and for about two weeks after the
upgrade (the first occurence happened soon after it).

What exactly do you mean by "swapping the hardware"? I'm already sure
it's not related to my storage, because a month ago I replaced my faulty
HDD with an SSD, but the bug still remained. Unfortunately, I don't have
spare PCs or resources to purchase new hardware.
