Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628E17F6
	for <regressions@lists.linux.dev>; Mon, 20 Jun 2022 09:02:33 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o3DIk-0008PF-GY; Mon, 20 Jun 2022 11:02:30 +0200
Message-ID: <bbf11aa0-4c32-47c9-c9f9-5ae7089be177@leemhuis.info>
Date: Mon, 20 Jun 2022 11:02:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Bug 215872] New: ath11k: QCA6390 firmware crashes after some
 time #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bug-215872-62941@https.bugzilla.kernel.org/>
 <9811c780-ea28-1461-6347-93a3cf218b6c@leemhuis.info>
In-Reply-To: <9811c780-ea28-1461-6347-93a3cf218b6c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1655715753;32a5162a;
X-HE-SMSGID: 1o3DIk-0008PF-GY

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 29.04.22 13:59, Thorsten Leemhuis wrote:
> On 21.04.22 22:07, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=215872
>>
>>             Bug ID: 215872
>>            Summary: ath11k: QCA6390 firmware crashes after some time
>>            Product: Drivers
>>            Version: 2.5
>>     Kernel Version: 5.17.3-arch1-1
>>           Hardware: x86-64
>>                 OS: Linux
>>               Tree: Mainline
>>             Status: NEW
>>           Severity: normal
>>           Priority: P1
>>          Component: Bluetooth
>>           Assignee: linux-bluetooth@vger.kernel.org
>>           Reporter: mail@kai-mast.de
>>         Regression: No
>>
>> Created attachment 300786
>>   --> https://bugzilla.kernel.org/attachment.cgi?id=300786&action=edit

Likely fixed, according to
https://bugzilla.kernel.org/show_bug.cgi?id=215872#c5

#regzbot fixed-by: d44e1dbda36ff
