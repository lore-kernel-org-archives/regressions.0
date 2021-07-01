Received: from 3.mo1.mail-out.ovh.net (3.mo1.mail-out.ovh.net [46.105.60.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719370
	for <regressions@lists.linux.dev>; Thu,  1 Jul 2021 18:11:37 +0000 (UTC)
Received: from player791.ha.ovh.net (unknown [10.110.171.54])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 9D0F920CA08
	for <regressions@lists.linux.dev>; Thu,  1 Jul 2021 18:54:55 +0200 (CEST)
Received: from RCM-web7.webmail.mail.ovh.net (static-176-175-108-40.ftth.abo.bbox.fr [176.175.108.40])
	(Authenticated sender: adel.ks@zegrapher.com)
	by player791.ha.ovh.net (Postfix) with ESMTPSA id 3F1611FBF86D1;
	Thu,  1 Jul 2021 16:54:53 +0000 (UTC)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 01 Jul 2021 18:54:53 +0200
From: adel.ks@zegrapher.com
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Kernel 5.12.10 and 5.12.9 freezing after boot-up with while sound
 output is looping
In-Reply-To: <754c7a20704ffb5fa1259035f29eff1b@zegrapher.com>
References: <d086de2a793eb2ea52acb11ed143675c@zegrapher.com>
 <YMbmeRH38Wp6BHPf@kroah.com>
 <b56d3d96-70d6-4ad5-9b8f-9b6fea958ad7@zegrapher.com>
 <f454b38b7987773caa72b656c4d2e3fb@zegrapher.com>
 <YMdgev1GDhmbAF4U@kroah.com>
 <13e1cfa157a63ff5dcacdbc0c4a41418@zegrapher.com>
 <fc8c123077a4892ca0c2e0d610d840f2@zegrapher.com>
 <754c7a20704ffb5fa1259035f29eff1b@zegrapher.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <b02b1c3e8bb378da56780ee91025a9b6@zegrapher.com>
X-Sender: adel.ks@zegrapher.com
X-Originating-IP: 176.175.108.40
X-Webmail-UserID: adel.ks@zegrapher.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17536735474727462587
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeeiiedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvffujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpegruggvlhdrkhhsseiivghgrhgrphhhvghrrdgtohhmnecuggftrfgrthhtvghrnhepgfeiveduuedvjeffudejveffleelkeeuvdffleefudejueduueffleehhfeigfegnecukfhppedtrddtrddtrddtpddujeeirddujeehrddutdekrdegtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprgguvghlrdhkshesiigvghhrrghphhgvrhdrtghomhdprhgtphhtthhopehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghv

Hello,

Kernel versions back to 5.9 were freezing on my machine. Which clearly 
indicated that something was wrong with my hardware: I pinpointed the 
issue to my BIOS. I had a few CPU options toggled on: "Global C states 
control", "Collaborative Processor Performance Control (CPPC)" and "CPPC 
Prefered cores". Toggling those settings back to "auto" (which means 
probably it's off ?) prevented the issue from happening since then. Note 
that the hardware these freezes was happening on is a AMD Ryzen 5950X 
with a X570 chipset motherboard.

Thank you

Kind regards,

Adel KARA SLIMANE
