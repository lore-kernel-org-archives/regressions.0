Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC42564
	for <regressions@lists.linux.dev>; Tue, 11 Oct 2022 09:49:44 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oiBtO-0002hh-32; Tue, 11 Oct 2022 11:49:42 +0200
Message-ID: <c47b4831-597e-6876-6d53-24866c739237@leemhuis.info>
Date: Tue, 11 Oct 2022 11:49:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
References: <20220927191200.216488-1-hamza.mahfooz@amd.com>
 <20221006064615.GA2817657@roeck-us.net>
 <20221006172337.GA753466@roeck-us.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
In-Reply-To: <20221006172337.GA753466@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1665481784;0ad9c39c;
X-HE-SMSGID: 1oiBtO-0002hh-32

[removed a lot of people from the list of recipients, as this is mainly
for Guenter]

Hi Guenter!

On 06.10.22 19:23, Guenter Roeck wrote:
> On Wed, Oct 05, 2022 at 11:46:15PM -0700, Guenter Roeck wrote:
>> On Tue, Sep 27, 2022 at 03:12:00PM -0400, Hamza Mahfooz wrote:
>>> Address the following error:
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ‘dc_stream_remove_writeback’:
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: array subscript [0, 0] is outside array bounds of ‘struct dc_writeback_info[1]’ [-Werror=array-bounds]
>>>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
>>>       |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
>>> In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
>>>                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
>>>                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
>>>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
>>> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing ‘writeback_info’
>>>   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
>>>       |
>>>
>>> Currently, we aren't checking to see if j remains within
>>> writeback_info[]'s bounds. So, add a check to make sure that we aren't
>>> overflowing the buffer.
>>>
>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>
>> With gcc 11.3, this patch doesn't fix a problem, it introduces one.
>>
>> Building csky:allmodconfig ... failed
>> --------------
>> Error log:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript 1 is above array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
>
> [...]
>
> #regzbot introduced: 5d8c3e836fc2

Thx for using regzbot, much appreciated. JFYI, the initial report was
your own mail you were replying to here, so a "#regzbot ^introduced:
..."  would have been more appropriate. In this case it didn't matter
anyway, as the fix didn't include a "Link:" tag to the initial report
anyway. No worries, I just have to tell regzbot about the fix manually then:

#regzbot fixed-by: faf4d8e07f5b67

Ciao, Thorsten
