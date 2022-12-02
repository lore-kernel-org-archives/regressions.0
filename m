Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2884C9E
	for <regressions@lists.linux.dev>; Fri,  2 Dec 2022 17:51:58 +0000 (UTC)
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 91E7920055;
	Fri,  2 Dec 2022 18:42:13 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 816D920041;
	Fri,  2 Dec 2022 18:42:13 +0100 (CET)
Message-ID: <19ea39c87df3c54cbc487466f806bc157d0bf563.camel@freebox.fr>
Subject: Re: [regression] Bug 216753 - 6e 6 ghz bands are disabled since
 5.16 on intel ax211
From: Maxime Bizon <mbizon@freebox.fr>
Reply-To: mbizon@freebox.fr
To: Dave Chiluk <chiluk@ubuntu.com>, Marcel Holtmann <marcel@holtmann.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, "Coelho, Luciano"
 <luciano.coelho@intel.com>, "Greenman, Gregory"
 <gregory.greenman@intel.com>,  "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, Johannes Berg
 <johannes@sipsolutions.net>,  "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Fri, 02 Dec 2022 18:42:13 +0100
In-Reply-To: <CAMfi-DQfuro4c_VUrFHBTv8sPnwuV8XhTV_W7qswGeCC2t-wzg@mail.gmail.com>
References: <14722778-dda0-cb9f-8647-892493d94a5c@leemhuis.info>
	 <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
	 <CAMfi-DRE-u5TNu2zAL-7A-ENHM9EiJeYJ38BL_FMdk6QmW7c9w@mail.gmail.com>
	 <9a03c244-adff-afaf-7385-d8e89cd3f338@leemhuis.info>
	 <02F8DDF1-EC0D-4EBD-88F5-7E000841C337@holtmann.org>
	 <CAMfi-DQfuro4c_VUrFHBTv8sPnwuV8XhTV_W7qswGeCC2t-wzg@mail.gmail.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit


On Fri, 2022-12-02 at 11:18 -0600, Dave Chiluk wrote:

Hello,

> The 6ghz band becomes disabled as soon as I upgrade to the 5.16+
> linux-stable kernels. So from a user perspective this really is a
> case of a kernel upgrade breaking user-space.  This is what led me
> down this rabbit hole here.
 
FWIW

I have the same issue on a Lenovo T14 gen2 laptop with built-in ax210
card, and sold as Wifi-6E compliant.

The exact patch you mention causes the issue, so it seems my bios does
not return the correct values either.

I recompiled the kernel with all those cmd_allow_xxx bitmaps set to ~0
and 6Ghz works fine.

-- 
Maxime



