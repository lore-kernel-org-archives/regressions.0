Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86A07C
	for <regressions@lists.linux.dev>; Fri,  4 Nov 2022 10:32:29 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oqtzv-0001Rb-8u; Fri, 04 Nov 2022 11:32:27 +0100
Message-ID: <69a138bb-1638-421b-a38c-f81a90701a3b@leemhuis.info>
Date: Fri, 4 Nov 2022 11:32:26 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: (bug report) HWMON & Thermal interactions #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <Y1WHnJ6h1RSOipV4@e120937-lin>
 <b0bf779e-6195-4fad-377a-ba1e63419c5d@leemhuis.info>
In-Reply-To: <b0bf779e-6195-4fad-377a-ba1e63419c5d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667557949;5851c01c;
X-HE-SMSGID: 1oqtzv-0001Rb-8u

On 24.10.22 12:18, Thorsten Leemhuis wrote:
> On 23.10.22 20:27, Cristian Marussi wrote:
>>
>> Starting with v6.1-rc1 the SCMI HWMON driver failed probing on my JUNO due
>> to the fact that no trip points were (ever !) defined in the DT; bisecting it
>> looks like that after:
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced e51813313
> #regzbot title SCMI HWMON driver failed probing on JUNO
> #regzbot ignore-activity

#regzbot fixed-by: c4a7b9b587ca
