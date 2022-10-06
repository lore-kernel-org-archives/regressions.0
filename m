Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A3A5D
	for <regressions@lists.linux.dev>; Thu,  6 Oct 2022 13:23:04 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ogQq6-00073P-Ev; Thu, 06 Oct 2022 15:23:02 +0200
Message-ID: <dd62210d-d095-f971-2b7b-0ec54fd189a9@leemhuis.info>
Date: Thu, 6 Oct 2022 15:23:01 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: 6.0.0-RC kernels trigger Firefox snap bug with 6.0.0-rc3 through
 6.0.0-rc7
Content-Language: en-US, de-DE
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 linux-kernel@vger.kernel.org
Cc: Marc Miltenberger <marcmiltenberger@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <b0c258c3-6dcf-aade-efc4-d62a8b3a1ce2@alu.unizg.hr>
 <5bb75cbc-a0db-537b-12d0-889230c865d8@leemhuis.info>
 <0fb2a9ff-df76-8af9-e54a-c2dc6bfd9478@leemhuis.info>
 <bdab45d3-c893-42ff-dbb9-5fa93d0dff55@alu.unizg.hr>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <bdab45d3-c893-42ff-dbb9-5fa93d0dff55@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1665062584;938732cf;
X-HE-SMSGID: 1ogQq6-00073P-Ev

On 06.10.22 14:43, Mirsad Todorovac wrote:
> On 10/6/22 14:25, Thorsten Leemhuis wrote:
> 
>> One more question:
>>
>> On 06.10.22 14:00, Thorsten Leemhuis wrote:
>> Were those two vanilla kernels? I asked in #snappy on IRC and was told
>> that "snapd simply expects some ubuntu bit in patched into the kernel if
>> it detects that it runs on an official ubuntu install...". This was also
>> suggested "it probably makes sense to file a but in LP to make the
>> kernel team aware".
>>
> Yes, last time I tried it with git clone from linux_stable on kernel.org
> and
> config-6.0.0-060000-generic from the official Ubuntu mainline build

You don't want to do that. Better take the config used to build a
working kernel (say 5.19.y) and then build 6.0 with it (after running
"make olddefconfig"), because it might be a new kernel option (say for a
new security technique) that might cause the problem, as explained here:
https://docs.kernel.org/admin-guide/reporting-regressions.html

Ciao, Thorsten
