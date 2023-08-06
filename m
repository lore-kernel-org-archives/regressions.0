Received: from abi149hd127.arn1.oracleemaildelivery.com (abi149hd127.arn1.oracleemaildelivery.com [129.149.84.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE49453B3
	for <regressions@lists.linux.dev>; Sun,  6 Aug 2023 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=x/SG0A30SFxLUadyn8TesCdeaY9lbopeGx+AqtWaSH8=;
 b=C+0lAmAwhYrlUEOg/RIc/wacgQBoujwxGhqqUcgOInd1LxjmmPHw1zhOlckEIwVFbd75wGEVBbjr
   irGqxzv+EJwnPlToLsJgRoaN+pSRkLhN4X9vyJw5P38DUd5oVAq1GxIXfE0xywidKb2qj4XJGQWn
   1eukAEOCfyKKqsYK18iuXGC2/liVnjlu8BRw1cLDM8tH+GqoEcTRRPwMCrVeeDAxSZ9wncjEVOee
   UqEb3a6X2jbC6lBAUYxxoHFPWLBRwa1Zj8RjjaoplXKadhk3cTmdwCkd6Ns6Waosao507K30EEbA
   rPpTHtsA5pkE2ZXy21iTGOH5ooKNGNWc97hWIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=x/SG0A30SFxLUadyn8TesCdeaY9lbopeGx+AqtWaSH8=;
 b=grz5RZOv+pIfbcPpS2paGkgXdbft3u/fTSi0ZQyBdTdBiNVl2zewx7VKLegh+9Wv4sI6hMR4gJzD
   C56llS8GCEstumBlU1t90ICOg55h//7dQa6lyPU22BOnOT3aYCCMFrnPXv1/BxWwcDiofsTyXOAI
   151kCgRsSSd+l+84wwLyfYZmAH56fr9NTg6KPYoC9H5yqW6Or9JY4qDg5cDL/MDVQieqpwO+2rYK
   LqkQaPe2QPFOfln8ZhTL0rMrjGhgB4F1uD06n2kFeUzuzs/uHIGzdIRKzy7ap8lnbI47w5gFRMNc
   7f+GQBamBeiBs2f/+YsY9mOCggg7XF2RPy9Nwg==
Received: by omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230707 64bit (built Jul  7
 2023))
 with ESMTPS id <0RYZ00IBR82AK120@omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Sun, 06 Aug 2023 15:51:46 +0000 (GMT)
Message-id: <e56c1c28-9300-4103-b9b1-52191c09c436@augustwikerfors.se>
Date: Sun, 6 Aug 2023 17:51:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
From: August Wikerfors <git@augustwikerfors.se>
Subject: Re: [PATCH] ACPI: resource: revert
 "Remove "Zen" specific match and quirks"
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
References: <20230806151453.10690-1-hdegoede@redhat.com>
Content-language: en-US
In-reply-to: <20230806151453.10690-1-hdegoede@redhat.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAH1BlvagG6VXJZ1MKDUlAUw9iWIQPC6vIGZnYKwTMs/fesCqfB/c4UbXaYbw7b5
 +holF8NzX225p2fEg/a8rflSLvHEpxdQxcTEQaMq/2ywi5WGPcH2PggJ12cpDuPF
 5NPUpPYFRfdhsFJhAmRd9mpbrqwcTSRDmwfx/zADjPnfJ0sNt6CQxtmVW+tMBXQL
 qkWng8BR2CMsC+Dh0Ed2mf/B0FIwfex8dzfiSHgWWbIunKTNZ4e9byOpzDiPf+Nb
 fVoXT9o782QL3IP+zDz6yklIpxPdgrfc5/EsP3HPEee/9xv4Z4Swfi/FMTf7L+VB
 1Y7qPDg5W0ZdYomqOZLAxcoMiay+2cvMyitJ79myj0C3ne4ahW8Vrhq5iNokfDnV
 k+asChGB228Zc+sMAirEUVFaFc0L2dW7Gu9bbV1oGJvWCUwuXluxe5EptgQ4tCuc y3Hydfk=

On 2023-08-06 17:14, Hans de Goede wrote:
> Commit a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and
> quirks") is causing keyboard problems for quite a log of AMD based
> laptop users, leading to many bug reports.
> 
> Revert this change for now, until we can come up with
> a better fix for the PS/2 IRQ trigger-type/polarity problems
> on some x86 laptops.
> 
> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229165
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229317
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217726

Other reports for various Lenovo laptops:
https://lore.kernel.org/all/596b9c4a-fb83-a8ab-3a44-6052d83fa546@augustwikerfors.se/T/
https://bugzilla.kernel.org/show_bug.cgi?id=217718
https://bugzilla.kernel.org/show_bug.cgi?id=217731

> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

FWIW only reverting a9c4a912b7dc will also cause a regression because it 
did also fix the keyboard on some devices, see the links in its commit 
message.

Regards,
August Wikerfors
