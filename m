Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF17E6
	for <regressions@lists.linux.dev>; Mon, 20 Jun 2022 07:00:02 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o3BOC-0005Ne-Js; Mon, 20 Jun 2022 09:00:00 +0200
Message-ID: <2bf69b55-a8fa-38cb-68f4-fd762877ac32@leemhuis.info>
Date: Mon, 20 Jun 2022 09:00:00 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Bug 215925] New: PCIe regression on Raspberry Pi Compute Module
 4 (CM4) breaks booting #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Linux PCI <linux-pci@vger.kernel.org>
References: <bug-215925-41252@https.bugzilla.kernel.org/>
 <CABhMZUWjZCwK1_qT2ghTSu2dguJBzBTpiTqKohyA72OSGMsaeg@mail.gmail.com>
 <3aa008b9-e477-3e6d-becb-13e28ea91f10@leemhuis.info>
In-Reply-To: <3aa008b9-e477-3e6d-becb-13e28ea91f10@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1655708402;b059d534;
X-HE-SMSGID: 1o3BOC-0005Ne-Js

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 09.05.22 09:44, Thorsten Leemhuis wrote:
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
> 
> On 02.05.22 20:38, Bjorn Helgaas wrote:
>> On Sat, Apr 30, 2022 at 2:53 PM <bugzilla-daemon@kernel.org> wrote:
>>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=215925

#regzbot fixed-by: f4fd559de3434c44
