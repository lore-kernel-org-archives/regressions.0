Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1609B1F937
	for <regressions@lists.linux.dev>; Fri, 22 Sep 2023 11:46:05 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qjebe-00063Z-UW; Fri, 22 Sep 2023 13:45:59 +0200
Message-ID: <785cbc11-3d85-4551-8290-0ca31e9be77e@leemhuis.info>
Date: Fri, 22 Sep 2023 13:45:58 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/PM: Mark devices disconnected if their upstream PCIe
 link is down on resume
Content-Language: en-US, de-DE
To: Bjorn Helgaas <helgaas@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
 Mark Blakeney <mark.blakeney@bullet-systems.net>,
 Kamil Paral <kparal@redhat.com>, Chris Chiu <chris.chiu@canonical.com>,
 linux-pci@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230921201945.GA343804@bhelgaas>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20230921201945.GA343804@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695383166;c9282489;
X-HE-SMSGID: 1qjebe-00063Z-UW

On 21.09.23 22:19, Bjorn Helgaas wrote:
> [+cc Kamil, Chris]
> 
> On Mon, Sep 18, 2023 at 08:30:41AM +0300, Mika Westerberg wrote:
>> Mark Blakeney reported that when suspending system with a Thunderbolt
>> dock connected and then unplugging the dock before resume (which is
>> pretty normal flow with laptops), resuming takes long time.
>>
>> What happens is that the PCIe link from the root port to the PCIe switch
>> inside the Thunderbolt device does not train (as expected, the link is
>> upplugged):
> [...]
>> Fixes: e8b908146d44 ("PCI/PM: Increase wait time after resume")
>> Reported-by: Mark Blakeney <mark.blakeney@bullet-systems.net>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217915
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Applied with Lukas' Reviewed-by to pm for v6.7.
>
> e8b908146d44 appeared in v6.4. 

Then why did you apply this for 6.7 and not to a branch targeting the
current cycle? Linus wants regression introduced during round about the
last 12 months to be handled liked regressions from the current cycle,
unless there is some good reason to treat the fix differently (big risk
of other regressions for example).

> Seems like maybe a candidate for stable? 

+1

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
