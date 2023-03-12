Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DCB1FC5
	for <regressions@lists.linux.dev>; Sun, 12 Mar 2023 13:10:23 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pbLSr-0002eF-Bo; Sun, 12 Mar 2023 14:10:17 +0100
Message-ID: <73bec5a8-98f7-5dca-3b34-cb6fe0b61249@leemhuis.info>
Date: Sun, 12 Mar 2023 14:10:16 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 14/17] media: i2c: imx290: Initialize runtime PM before
 subdev
Content-Language: en-US, de-DE
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 regressions@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
 <20230116144454.1012-15-laurent.pinchart@ideasonboard.com>
 <20230227175245.GA3728693@roeck-us.net>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230227175245.GA3728693@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678626623;24a23807;
X-HE-SMSGID: 1pbLSr-0002eF-Bo

On 27.02.23 18:52, Guenter Roeck wrote:
> On Mon, Jan 16, 2023 at 04:44:51PM +0200, Laurent Pinchart wrote:
>> Initializing the subdev before runtime PM means that no subdev
>> initialization can interact with the runtime PM framework. This can be
>> problematic when modifying controls, as the .s_ctrl() handler commonly
>> calls pm_runtime_get_if_in_use(). These code paths are not trivial,
>> making the driver fragile and possibly causing subtle bugs.
>>
>> To make the subdev initialization more robust, initialize runtime PM
>> first.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> ---
> 
> This patch results in
> 
> Error log:
> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> drivers/media/i2c/imx290.c:1090:12: error: 'imx290_runtime_suspend' defined but not used [-Werror=unused-function]
>  1090 | static int imx290_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> drivers/media/i2c/imx290.c:1082:12: error: 'imx290_runtime_resume' defined but not used [-Werror=unused-function]
>  1082 | static int imx290_runtime_resume(struct device *dev)
> 
> if PM runtime support is disabled( alpha:allmodconfig, csky:allmodconfig,
> and others).

Looks like Guenter never got a reply, but from a recent kernelci report
it looks like above warning still happens:
https://lore.kernel.org/all/640bceb7.a70a0220.af8cd.146b@mx.google.com/

Laurent, do you still have it on your radar?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
