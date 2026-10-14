Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79EF4772BF
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006463; cv=none; b=mwMd+iwTfVOf5eUYnWR+1bq68vsH08mm3cmiPylbmLjZL4w7z+UKKtOOKPEe06ldbENN+sqr7JhOWaQhRzqOuoOek87BUUXlxeHDBMXFCvbnDjMHuGOwZN4ZLcOhZk2cnIi8/eldNbKho68kq1Iu/Dmj+tzuLyyeJ+89OYCfc+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006463; c=relaxed/simple;
	bh=P5D41TPMszDFwmi+9Thary4c+pBWFokKdkq97su8ME4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kVc3iECnuXCNfkM4SrcCRyPHrA6+/K7D15dbNg9PJIp4xGbCJd7fQhycGz6eBkWSK8U4UhYIrLx4rQKDmOSEyQNijut1TpqUW1oqxvUIpnBQaK6dvr8xq1bgOE3B/8MUg45lNUp6XdOS04mKkMR9kNCX5DQU5BcD3Ny5WlUrrJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVjn/l52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqZtLQ7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVjn/l52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IqZtLQ7c"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb0Kx905392
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 19:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GnhGY3RzzdOINimVNMXLyuHee2jRbACLoRlBFEYOD8=; b=ZVjn/l52ySIJASmc
	S1EmWypbbfJDMpqIrmkfqn0Sqsl0OvP2UPgJEtAlWbF/McNRVT7zZzPPXKEx2Z4a
	aRGZGkWvuRjKn/bQE2+bMANSVGd+SZuMjC/iZf1s1OyrhHTBwQQtVBF0J6c2cvwC
	xQ2+RJcI4ZLYdPgM+ZfkIlyHBkfeeP0CHh/Tc/g32GFDseTzv512vRfmUFM6EPz8
	J/8EIrrzF5rHR05UfGrKLjlz6YckSFiArBFNTqRRGsLHLEWU2bYtsTR3gomm12ok
	ttjBmTH+CPnFE9jTFMTeJ15GkgMjsb2fPbFTAcwegu8Mso3tGbMgMFGjgCJBHMeN
	ykmfUA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p38wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 19:34:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bb074ed1aso23878416d6.2
        for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 12:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792006460; x=1792611260; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2GnhGY3RzzdOINimVNMXLyuHee2jRbACLoRlBFEYOD8=;
        b=IqZtLQ7cQj9N95gnkxPtaVdDfR5z/17dfhabRs6Phs37TDwRfplqelgctBzApLW9eh
         0EJyRwJyrtj7DkrmCXuEoUKQYcl5ZxDQw+L5BiqDsQaDBKmyNAiYaG2Wq/bG5nRQuEXN
         Ft6ubkxNyeKLArArxvgCTGdl9F7clehJVMmAXEsO0olI1f22UqIhtjC1oX5Mtmy82PsJ
         APYaEJyN5dQYWf/z6uKwE0iZSQhMvhHTxTi9ploQZoNByrP9iBtuPIKfARHm0IO0v73E
         5y0RGtFsQZegihZwGF6joO4zMKIE9fKH8dmhjhdwb1VTi9KfRAkgOJ3Gbh7/QNKXorfS
         VaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006460; x=1792611260;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GnhGY3RzzdOINimVNMXLyuHee2jRbACLoRlBFEYOD8=;
        b=K4TPY5eIp0f4i8YCp+J5GWlFPc1SuLwe9iVQNNweB9udHYNaIdTLi7UARtgdvDjXpf
         cpt1lmOVVdoRp0cQfJ2/x90dA/CV97XHLdjFy0o3R1pygWTxX6PQBwTR+XaXw5HzMmUT
         hQHYakxUA7KR45Ui9xs50Ur4A8FIRotSapkw3IbAp5jQRHMudD+zQ1Ap0WAJXEMp8PmP
         Q1KdWLurEKhIeKqGzxW8RnRqEMfKJooD64drj5OrzwsEkTqFTxQ15CKydcTXHiS2laZG
         UEsu45V6sq0KW8IASsZgb7Y9Lc2rmCJ1SND8KGqhOBzG8WE8QBJ1p8GMQkpWdiZH28Oj
         ZvEw==
X-Forwarded-Encrypted: i=1; AKwUvBzZ4IqIOah6EtXrV8OGEZqhcZ+EzpAwVmTRwKMEpsYxBZQvMo629QHotAtUtJxg5CorZ4j3y51GsMF25g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIZadWwJy+n6iFlTFIzP0oKZsfBLksNDQZmj6IvLmfaBGB2k1QR
	dk4ag5sKqy7IiG4+Sxa8PgdTAzWUSEm0D59YlMpTuX97Vyydu5K2b90RfcXhG0MWFcIz341aRcV
	XcbJ87BDRgqroNr8U7B8WRLwtZ4UPPw77Fv62p0QwNWS1C/hS74ttWs7cTrBzlOa5fA==
X-Gm-Gg: AYBFou1v+dGVssouWeV1JRtGVn+uHVM2MHS3q3X9Ti9ZkvK5QduJDw6wPkrcBpvVYGc
	38l7NPFKXf9C62DT4KC4V681yuJfpX0Xui+vNompUdpDBqD3ybx1c2bJgTQ4vKOMAlZMDnbgiHG
	RC+TkOHl7L40it2YZFQQpmQwR33GJHHX4f+w3s+7Vp1x8u7NAb5vZ+LsWQ2s54GHpIxCN/xWYCE
	l6cbwc8RXv5wdfQvoyWVz2xFq29z8XEoiBQ9TsBlBUxumyOzQnptXfOVbdQ4WcfIVkaXVnKtKQL
	UsGJ9Yrdh1EEha5zZnwdHwnKtLI6IvSVP55/gF5dC8/rWs58BaNpExjGGvhEmSSvsbRk0DBLwOx
	gsM5khU1XFWriHVE=
X-Received: by 2002:ac8:5cd4:0:b0:535:f3e:745d with SMTP id d75a77b69052e-5359fade2a5mr260834311cf.14.1792006459553;
        Wed, 14 Oct 2026 12:34:19 -0700 (PDT)
X-Received: by 2002:ac8:5cd4:0:b0:535:f3e:745d with SMTP id d75a77b69052e-5359fade2a5mr260833941cf.14.1792006458922;
        Wed, 14 Oct 2026 12:34:18 -0700 (PDT)
Received: from [10.100.0.2] ([187.14.53.100])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536128240a6sm4865511cf.26.2026.10.14.12.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:34:18 -0700 (PDT)
Message-ID: <35eb7d07-3b21-44fd-8055-9005cdd4bb82@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:34:15 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] ACPI: battery: Re-read battery information in the
 complete callback
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>,
        Len Brown <lenb@kernel.org>, Armin Wolf <W_Armin@gmx.de>,
        Charis Stratakis <c.stratakis@proton.me>, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, regressions@lists.linux.dev,
        Mark Pearson <mpearson-lenovo@squebb.ca>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <37N_jFulf7n-Z55NfKfE71C_wVPxYvZ0xD_iRUg2fXu7TypDiF5PStQ6siSfVBih6fThg5WoPes8U5ZQpfVm_teMFcUGXFxz2DdMbfSWuws=@proton.me>
 <20261012225141.13683-1-aliamemis@disroot.org>
 <fb993dd3-ee56-4e3d-aa16-573f011518f1@oss.qualcomm.com>
 <CAJZ5v0gS4agVUkCO6M=VW4Wi2y1-s+k23bpzmX9aAZ0Rsv4z9Q@mail.gmail.com>
 <044e9df4-1399-4ceb-80f8-f7cfe031d04f@oss.qualcomm.com>
 <CAJZ5v0isCM3K3U6HSdDnvXzBX41AgQMFYxqLx3KvMA0W_91-ew@mail.gmail.com>
 <b64b8092-93d7-4873-a55f-422b8e70cc04@oss.qualcomm.com>
 <CAJZ5v0j4xiDYBGA0LsUq4esJCzYBXjsmmXb1ZJvLcUZqDp+yuQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAJZ5v0j4xiDYBGA0LsUq4esJCzYBXjsmmXb1ZJvLcUZqDp+yuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NyBTYWx0ZWRfX2x4vlG5bJkwN
 dA6TVpa5vEGH3JghoqZg51/ccWFBq+dzg2WhMyr73KYbPe4iJI+LKK+msyRZ+ZoRiW59uWqDJ3k
 YZvBikrJ2iAZdixRq57miL1GScUoonI=
X-Proofpoint-ORIG-GUID: -DeHCEgv_jDvJnoPzFE1iH4bP5EyOolJ
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfd93c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=nR5e2CNZUcRYUIBrilOkzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=cwUVlSfaqmp_W9nHBhMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NyBTYWx0ZWRfX3Kz/8hkibq6f
 BW4drkc9/TgmKZBK6bB7yQdsri46UwjEDI8HHuHUvthWVuQKjtfJM09soXg/GgtkRNkI468gcwu
 byGcHkzZiUIGSVlmUup+B/PZGZI7q/LiVS2PlTHEqvBiKdtZVhRblCoGD+A01m39eWM1RB47gfi
 2L8XdPUDHgh8uaXSLPJR1TjiWABq0Lq0LOVu35cDhAl7bnUy0hqY8jodKh45Su6oSXcrzpDV/ym
 ugosX1wVVMQssR+/AdQDx5GWg/8j82K0kGEToKN/K77xMNy3YI9zK9VPFIQgNQh0jDQRoG69Z15
 h43wqV23Cu93dzYgHHxSSV+IP1iy4W5RwGcpANlpLZnUjy9XvReqwWOB8DefFWGlBO8lsu1phVe
 ZvheUlg/R5llTGZ9kQBiK0c8zAm+OyzMlC2UR44gNXhBIZ+tvoiWckb2mQ5vkX+Tkcu+c2p2A8V
 oWcbjo/bqVEQM4O6vcQ==
X-Proofpoint-GUID: -DeHCEgv_jDvJnoPzFE1iH4bP5EyOolJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140077

Hi,

On 14-Oct-26 17:06, Rafael J. Wysocki (Intel) wrote:
> Hi Hans,
> 
> On Wed, Oct 14, 2026 at 11:58 AM <johannes.goede@oss.qualcomm.com> wrote:
>>
>> Hi Rafael,
>>
>> On 13-Oct-26 19:20, Rafael J. Wysocki (Intel) wrote:
>>> Hi Hans,
>>>
>>> On Tue, Oct 13, 2026 at 3:36 PM <johannes.goede@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Rafael,
>>>>
>>>> On 13-Oct-26 13:58, Rafael J. Wysocki (Intel) wrote:
>>>>> On Tue, Oct 13, 2026 at 11:33 AM <johannes.goede@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 13-Oct-26 00:46, Ali Ahmet Memiş wrote:
>>>>>>> Since commit d33e89d12295 ("thermal: core: Suspend thermal zones later
>>>>>>> and resume them earlier"), thermal zones are resumed from dpm_complete(),
>>>>>>> before the PM_POST_SUSPEND notifier that re-reads _BIX and _BST. On
>>>>>>> ThinkPad P1 Gen2 and P53, INT3403 _TMP calls \GTST which switches the EC
>>>>>>> page selector (HIID) without taking the BATM mutex used by the battery
>>>>>>> methods. ACPICA releases the interpreter lock around EC accesses
>>>>>>
>>>>>> I'm wondering if this "ACPICA releases the interpreter lock around EC
>>>>>> accesses" is not the real problem here.
>>>>>
>>>>> Yes, it most likely is.
>>>>>
>>>>> What actually happens is that ACPICA drops the interpreter lock and
>>>>> the namespace lock in several cases listed in the
>>>>> acpi_ex_exit_interpreter() documentation comment, the majority of
>>>>> which involve having to wait.
>>>>>
>>>>> The bottom line though is that the interpreter and namespace locks
>>>>> cannot be expected to be held throughout AML evaluation because it is
>>>>> not known in advance if any of the cases in question will appear.
>>>>>
>>>>>> Recently I've learned / heard
>>>>>> from a trusted source that Windows ACPI subsystem is very much single
>>>>>> threaded. So it is nice that ACPI has these mutexes and other stuff
>>>>>> to support multi-threading but as long as Windows ACPI interpreter is
>>>>>> not multi-threaded I think we may need to consider to copy Windows
>>>>>> behavior.
>>>>>
>>>>> This is also my conclusion, at least to some extent.
>>>>>
>>>>> The problem with it though is that in some cases parallel evaluation
>>>>> of AML is actually useful.  For example, say two PCI devices are
>>>>> powered up at the same time and AML waits for each of them.  The async
>>>>> suspend/resume aligns those waits to take place simultaneously instead
>>>>> of serializing them which allows some time to be saved.
>>>>>
>>>>>> So maybe the EC accesses should keep the interpreter lock locked during
>>>>>> EC accesses.
>>>>>
>>>>> The problem here is that it is hard to say in advance whether or not
>>>>> _BIX or _BST will access the EC and whether or not that will clash
>>>>> with _TMP evaluation for a seemingly unrelated thermal zone.
>>>>>
>>>>>> And even go further and maybe we need to introduce a big-acpi-lock,
>>>>>> which I guess the interpreter lock more or less is? And just serialize
>>>>>> all ACPI accesses since most ACPI tables clearly do not handle
>>>>>> multi-threaded access to ACPI methods well ?
>>>>>
>>>>> I would be inclined to do so except for device power management
>>>>> methods, that is _ON, _OFF, and _PSx, that are not the problematic
>>>>> ones, at least as far as I know.
>>>>
>>>> That sounds like a reasonable compromise which should fix both
>>>> this case as well as help with bko221065 .
>>>>
>>>>>> Another example of multi-threaded ACPI calls causing problems is:
>>>>>>
>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=221065
>>>>>
>>>>> Right.
>>>>>
>>>>> So I guess the idea would be to add locking to acpi_evaluate_object()?
>>>>
>>>> Yes that seems like a nice single point of entry to do this where
>>>> all the various helpers eventually end up.
>>>
>>> That, of course, would require updating ACPICA code and I'm not sure
>>> if doing it upstream is useful.  For example, if some hosts already
>>> use locking around acpi_evaluate_object(), this modification won't
>>> help them and it will certainly be a change in behavior.
>>>
>>> This means that we'll likely end up with a Linux-specific divergence
>>> from the upstream which can be lived with, but it won't be nice.
>>
>> Ah, I see.
>>
>>>>> An alternative might be to introduce an "exclusive" variant of
>>>>> acpi_evaluate_object() with built-in locking and use it in the cases
>>>>> that are known-problematic.
>>>>
>>>> So here we have _TMP and _BIX / _BST and in bko221065 we have
>>>> a bunch of again batteyr methods + UCSI racing. I'm afraid if
>>>> we add something like acpi_evaluate_object_exclusive() we'll end
>>>> up eventually using that almost everywhere.
>>>
>>> While I think that your concern is valid, this can be done without
>>> touching the ACPICA code at all.
>>
>> Not needing to touch ACPICA is a valid concern. So I agree lets go
>> with a wrapper for paths which we know need to be serialized for now.
>>
>> And then add that around the battery methods + _TMP + UCSI methods
>> for starters I guess ?
> 
> Yes.
> 
>> ###
>>
>> Should we also stop releasing the interpreter lock in the EC code?
> 
> Which EC code do you mean in particular?

I meant the event-handling code, but I forgot the unlock is
actually in the ACPICA core, not in the Linux code.

Anyways I think this is nicely covered by Ali's latest series:

https://lore.kernel.org/all/20261014132703.93355-1-aliamemis@disroot.org/

Regards,

Hans


