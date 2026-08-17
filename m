Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BBD3CBE6F
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960291; cv=none; b=apMTEYn8kz5iobdI3LEYEiL0eClhDGvHisrTULd/5TaDx1FjVpbwgzMz2Hjc74pZz6pmPJX7ckQpNMjhZ8FLXYtA9wtdHVTvfarYfl3dEzfXoKPLlsyyP147Q7syHZNpZvWbpDgbiF/Srg0jdMvezNbDnydCuZu+DoS3mmTvSjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960291; c=relaxed/simple;
	bh=OJ9WKdqxcGDYb3rlMNGK7ePpJ25RXviWGxzo8Ekr1Aw=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:Cc:
	 References:In-Reply-To; b=JZwT9SOyEMvGHYzCN3EHgzBzMa9U/A26MCbELhnwKgI+fWtRAY0p0LsOXuozJbKQ+tYx+sxvd/NCG1uGdbYzBNVmcJvmDOojIO21+0eSJ2F6VBXYA0NPKXdoO4oII74Lef9ucrIuW/b2GvFEsLdU0PMOy8T29wenVkmRLCwT2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eO54bweS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIpazqyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eO54bweS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIpazqyA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dwJS1963829
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 09:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uzLB7NDYFk4dB3bx/F/lwK1R
	wGZyfVJaQJovIg4Z6yc=; b=eO54bweS8zM1NKkLUPzo8cYrekD+EQ/SKKRvThlS
	hG5mitgRLGgpJMp7DzXcQp20hEEVEJiPha3eMcPFGoaYdb4nPaprPpqJ2460cTpm
	hUn8o+6XeUp7r49q9UMFCnBbdTmuPGQ2/Nc/7qJUWEGfhaHcc1xTOSicIKLQOG7m
	580BuvCYpiQ2R6DxUyyv2PO/IZLFnEyLDr90lNj3H1D5CGk7hKGdbQqOmjr+XYlJ
	mfOujsAE1Zs1j+GI+T6Rgl/QOycfz7sePg1nRAeY1DVyIDKtQfPUKOCBdpRHAARv
	i/MfwfT2lBanPc5bJLdUUY7oXMbLIBO9d9pZBc8+LKPtbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wregkse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 09:51:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso399317985a.0
        for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786960287; x=1787565087; darn=lists.linux.dev;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzLB7NDYFk4dB3bx/F/lwK1RwGZyfVJaQJovIg4Z6yc=;
        b=RIpazqyAcSIbrx/1HsafHoQkGUerT6agmoeF6nvOPCyVDcZ0ZLvdD48SC589z4pkY6
         gm33ttqOVwbfxPzciq/B8gyGLeNeb2HBsSeysnfw8G3Ho4Qmu+tjz1kiwrQnaRjF15ab
         Kb0FA4OUEHyaaPhl9Znxh4YYBlMS2LTFXibT/VWTGkZAi0ZSK1FdQzrxwvrkSu5BaKTa
         8x3twQvd7ikIzTy6Vub/SDgtREBs2wS13vkO/DMu+zHJMhE4kAoUe618JYCLDt2jO2+T
         7rRueJxMMb7HeQPEpBlo/2nhQkEja9TUOfqaJXZGfL9rgdYTdd4PWJwDxX3kE774epKe
         yvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960287; x=1787565087;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzLB7NDYFk4dB3bx/F/lwK1RwGZyfVJaQJovIg4Z6yc=;
        b=AFJ8qPh50UAcatVRDsmp0qPQxT92uMZ8LGZV43/eMSZKdTQqRbWjpX35liU+/OShsN
         3ZIp58EneXAINnOCBIIP0i80cOEQnMjYFeG+3/Cac/GSz2sPxe4bWICsKXRfyc4uLk14
         CWaHYXgu76J0zH5UcqXTNZ20FdE94p4s+ou+vKuf2Do14g9Wia2IdQ4023aIUyee5qZo
         PzGdCQRnvDYay2s61V/pW4PRhCPye4WGXiSNtvHTiWSX/k+xnw+5SSg7fqIse3nMKyRa
         Yo7PMrXcvH3RJQ3nhHVKgYPBRMQ0R0tZYb6JWGZL0N2jYGT9wHpwmVxjhmhVnMqwT0z4
         J82Q==
X-Forwarded-Encrypted: i=1; AHgh+RouUPPhaTPfrc0DCrIEg392yP1tRLTqb+YkLpf9n5rKwlnRbxoCMGTyWmm9QDw8abK7x/EPMXn0TWuGew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRxUoR8109zE3cT0VOeolkvYHc7gI37oqlySkREWVlxn7CWs0k
	SyzJfM53Hi93dbLwuVPJxN0TTUbZkM1hHdqyiNfssCR7wMMwXuZ03uCeFz7TDybC6zH4I1NNY2C
	pzxKTi60IclI8nF+lxOfb8TaCD+8yRBkJ1hT+/82Br+j4ySob+gDZVJJIOuAqQDuP+w==
X-Gm-Gg: AR+sD13CfM/rhPn6o/HCGjsxWHuLiQ8Mo6erNigL/89q3bS8QgynUiIHGtD5CTymHKk
	VD5mpjBMZb49iKGPn5Dk9rBsGVpE0AkNy4rv37Cy+9wOdic9L3XJnc9hl4vfWEocaU8B5hScdbk
	qfe7JlTU0lB6A+CDU4hPMQc0TPqaPVu+b79xXp9XQ9t0SdWJ7CXkWFX3AsXjYQw03AaqSzQPH2V
	YGBKAveBoRYfdHXV7D+YwJjYfYEAJ2CQP2Xd5sTMIwC9ebTt2tVt59NxF8TzfBMmW+XwR10wl3H
	+BR8TOeAgc4dGe+UGQooZFy0h75vsfGmedBPudt3doEhLplNSaNr3QDQC+QW0X3VC14WHQO7cg0
	V7UtbjxCfjKUZMY8xqa4=
X-Received: by 2002:a05:620a:47a4:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-936c07ccaa2mr2570371085a.21.1786960287473;
        Mon, 17 Aug 2026 02:51:27 -0700 (PDT)
X-Received: by 2002:a05:620a:47a4:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-936c07ccaa2mr2570368685a.21.1786960286981;
        Mon, 17 Aug 2026 02:51:26 -0700 (PDT)
Received: from [10.40.99.41] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c212378a3a8sm437945866b.38.2026.08.17.02.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 02:51:25 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------7fs0YenUPaYs1nN08Jz0k0Fo"
Message-ID: <1bca212d-fe9c-4666-8ac1-743f8c9ef1c5@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 11:51:24 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: i2c designware change broke touchpad of a thinkpad
To: Hardik Prakash <hardikprakash.official@gmail.com>,
        Thorsten Leemhuis <linux@leemhuis.info>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, wsa@kernel.org, brgl@bgdev.pl,
        basavaraj.natikar@amd.com, linusw@kernel.org, nathan@kernel.org,
        chaitanya.kumar.borah@intel.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260718054330.8975-2-hardikprakash.official@gmail.com>
 <amhodWpAI3K6aeBH@zenone.zhora.eu>
 <b4a4eadb-282f-464c-843a-19d415a34d0c@leemhuis.info>
 <CANTFpSW+w1GZMbLXszuqZFCZjeVJfFG2bc1vJad+OMzsy-CPCg@mail.gmail.com>
 <aneQvMN_Zet2b62n@ashevche-desk.local>
 <b5b95476-636f-40b1-8575-47918169b7bb@leemhuis.info>
 <CANTFpSWzV9tzMwc2cURCQBhpZmrv1SsZqnwBEu0jt=ZQWfvWgQ@mail.gmail.com>
 <1a209e14-05c6-4796-a8fc-d0c3a776520d@leemhuis.info>
 <CANTFpSWnTjoTS8hBOvVM_w3pWHyOiBhch_GXe_mG-d56WeF-0w@mail.gmail.com>
 <5a5f7f58-b35b-407f-a5e5-293a88cafcc0@leemhuis.info>
 <CANTFpSWTkwmb3F9UnZmeaLizH-cC6evXD=kd1eNwJWkCfyj8DQ@mail.gmail.com>
 <a23375c9-d188-4737-bfa0-f10e66ae7f08@leemhuis.info>
 <CANTFpSWhqkw4735EFyQ4XoSEiqsgCKt4jTxH4SDO-m3=ybwccw@mail.gmail.com>
 <444caa3c-01ae-4516-b63a-576e095fef94@amd.com>
 <9095d7c8-92fe-4163-98f8-a53bbcefd6cb@leemhuis.info>
 <CANTFpSV9jguMzmfN7STb7XANYdn8i34bVmpT=0NdJ_o=3_Y1CQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CANTFpSV9jguMzmfN7STb7XANYdn8i34bVmpT=0NdJ_o=3_Y1CQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a82d9a0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=heybgEeZJAOY0L2PbugA:9 a=QEXdDO2ut3YA:10
 a=JELz9Z6cFEKlipGbefoA:9 a=B2y7HmGcmWMA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 44ESKr6N-KA7ebWnT9x3NhJgdnq7ASjN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3MyBTYWx0ZWRfX8fux5UxkL2NX
 iL/MznynmHWDsEP1WqmA3WieNX33IvO2o3tztEKLDfmm851tNN5d+UBbjYXe0VWW/PGi01SdJTP
 k3jseIRY2hwBZ5yYZKatTuSPlw3AFykNbOh38PapOS9+9ocjAkkv+ffTNOEimQJN7zMvjRde+TB
 oaHpTtYXlaEdYyuggklM/YYp3Gk0KckIsCb6oXRDf0f/VYob5qgX6dvIZ90XNl21dDHMQhffF2B
 6I1AEYv81/fVAhooTD+1ouhBygQyGo4inSrV9ph9ArA+OkPlplCLHuJgyQ2s2e0eOb2nRNJCktK
 7C2AxGQv+pBjvCebdoixxuaKZsPRznDiA5E+SnL5ty24LP+QynD+KoGZQm4D/GtLB2IB7XOZKIB
 Pa+vTBCDRE+lVHiJPROOVFVBoGU1lnU1GNG/qTN+jC+iQ9UlOIbTJfqX01soDr3bjEkgFncG+1Z
 r2aor0RerAV22YlwS3g==
X-Proofpoint-GUID: 44ESKr6N-KA7ebWnT9x3NhJgdnq7ASjN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3MyBTYWx0ZWRfX8oodocBwLFIY
 2WbrSBSpLTj7HcukFPplRjiZNBSXgnQLKTRZcrY5uGdgwPNZuHv4MmRBQinPxozhDVAIQEFa+oe
 AlG2TllzLPTiYIxIboAzrl8phZ5tKkY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170073

This is a multi-part message in MIME format.
--------------7fs0YenUPaYs1nN08Jz0k0Fo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hardik,

On 14-Aug-26 12:09 PM, Hardik Prakash wrote:
> On Wed, 13 Aug 2026, Thorsten Leemhuis wrote:
>> Hardik, could you submit a revert to the lists? And then I'll provide my
>> Tested-by and ask Linus to directly pick this up?
> 
> Sent: https://lore.kernel.org/all/20260814100719.9548-1-hardikprakash.official@gmail.com/
> 
> Verified on my end that it builds clean, boots clean, and correctly
> restores the original Yoga 7 race (expected tradeoff) without
> introducing anything else.

Thank you for submitting a revert for this. Note it looks like Torvalds himself
beat you to it and already reverted this for 7.2 final :)

I hit another problem caused by this now reverted change, where the PMIC
i2c bus would not show up on many Intel BYT/CHT devices. I wrote a fix for
this (attached) on top of the now reverted commit.

I think my fix might also have helped for the broken touchpad issue from this
thread, but I believe there is a better way to fix all this, so IMHO it is
good that this was reverted.

If I understand things correctly the problem the reverted fix was trying
to fix is i2c-transfer errors happening before the GPIO controller driver
is ready.

The i2c-core will not initiate transfers itself, so the problem is that
the i2c-hid driver is initiating transfers before the GPIO controller
is setup.

The i2c-hid driver does actually request the interrupt itself, so we can
simply wait for that to succeed inside the i2c-hid code. ATM the i2c-hid
code starts with an i2c-connectivity check because some ACPI tables list
non existing I2C-HID devices.

But we could make the i2c-hid driver start with first requesting its IRQ
and if that fails bail (with -EPROBE_DEFER) before doing any i2c-transfers.

And then do the i2c-connectivity test after requesting the IRQ. So basically
swap the order of i2c-connectivity test vs IRQ requesting.

The IRQ requesting should then use the IRQF_NO_AUTOEN flag to keep the IRQ
disabled at first and explicitly enable it later when the rest of the driver
setup is done.

Hardik, can you take a shot at coding up the suggested i2c-hid(-core) changes
and test to see if this fixes the original Yoga 7 race in a cleaner manner ?

Regards,

Hans


--------------7fs0YenUPaYs1nN08Jz0k0Fo
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-i2c-designware-Make-check_child_gpioint-skip-devices.patch"
Content-Disposition: attachment;
 filename*0="0001-i2c-designware-Make-check_child_gpioint-skip-devices.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBlMTJhNzFjNjRiOTk2NTYwZDUyMWVhOWRkYTMxYThjNjI5YjUwNGU0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBv
c3MucXVhbGNvbW0uY29tPgpEYXRlOiBTdW4sIDE2IEF1ZyAyMDI2IDIzOjA2OjA3ICswMjAw
ClN1YmplY3Q6IFtQQVRDSF0gaTJjOiBkZXNpZ253YXJlOiBNYWtlIGNoZWNrX2NoaWxkX2dw
aW9pbnQoKSBza2lwIGRldmljZXMKIHdoaWNoIGFyZSBub3QgcHJlc2VudAoKQ29tbWl0IDBh
NGJiMmFiYzNlNSAoImkyYzogZGVzaWdud2FyZTogZGVmZXIgcHJvYmUgaWYgY2hpbGQgR3Bp
b0ludApjb250cm9sbGVycyBhcmUgbm90IGJvdW5kIikgbWFrZXMgaTJjLWRlc2lnbndhcmUt
cGxhdGRydiBkZWxheSBiaW5kaW5nCnVudGlsIGFsbCBHcGlvSW50IHJlc291cmNlcyBvZiBj
aGlsZHJlbiBvZiB0aGUgaTJjLWNvbnRyb2xsZXIgYXJlCmF2YWlsYWJsZS4KClRoaXMgY2F1
c2VzIHRoZSBkcml2ZXIgdG8gc29tZXRpbWVzIG5ldmVyIGJvdW5kIGluIGNhc2Ugb2YgYm9n
dXMsIG9yCm5vdCBzdXBwb3J0ZWQgYnkgTGludXggR3Bpb0ludCByZXNvdXJjZXMgb24gc29t
ZSBvZiB0aGUgaTJjLWNsaWVudHMgb2YKdGhlIGNvbnRyb2xsZXIsIHdoaWNoIGNhdXNlcyAq
YWxsKiBvZiB0aGUgY2xpZW50cyB0byBub3Qgd29yayEKCkFDUEkgdGFibGVzIHR5cGljYWxs
eSBjb250YWluIGRlc2NyaXB0aW9ucyBvZiBtYW55IHBvc3NpYmxlIGkyYy1jbGllbnRzCnVu
ZGVyIGFuIGkyYy1jb250cm9sbGVyIChlLmcuIHNlY29uZCBzb3VyY2VzIG9mIGRldmljZXMp
IGJ1dCBvbmx5CmEgZmV3IGFyZSBhY3R1YWxseSBtYXJrZWQgYXMgYmVpbmcgcHJlc2VudC4g
VGhlIGtlcm5lbCB3aWxsIG9ubHkKaW5zdGFudGlhdGUgaTJjLWNsaWVudHMgZm9yIHRob3Nl
IHdoaWNoIGFyZSBwcmVzZW50LCBtYWtlIHRoZSBHcGlvSW50CiJyZWFkeSIgY2hlY2sgb25s
eSBjaGVjayBhY3R1YWxseSBwcmVzZW50IGkyYy1jbGllbnRzLgoKSW50ZWwgQllUL0NIVCBk
ZXZpY2VzIGhhdmUgYSBzcGVjaWFsIElOVDMzRkUgaTJjLWNsaWVudCB3aGljaCBpcwphIGR1
cGxpY2F0ZSBvZiB0aGUgZXhpc2l0aW5nIFBNSUMgaTJjLWNsaWVudCwgd2l0aCBub24gc3Vw
cG9ydGVkCkdwaW9JbnQgcmVzb3VyY2VzIChwb2ludGluZyBiYWNrIHRvIHRoZSBQTUlDKS4g
TGludXggYWxyZWFkeSBpZ25vcmVzCnRoZXNlLCBzbyBtYWtlIHRoZSBHcGlvSW50IGNoZWNr
IHNraXAgdGhlc2UgdG9vLgoKVGhpcyBmaXhlcyBpMmMtZGVzaWdud2FyZS1wbGF0ZHJ2IG5v
dCBiaW5kaW5nIHRvIHRoZSBQTUlDIEkyQyBidXMgb24gbWFueQpJbnRlbCBCYXkgVHJhaWwg
YW5kIENoZXJyeSBUcmFpbCBkZXZpY2VzIGxpa2UgZS5nLiB0aGUgTVBtYW4gQ29udmVydG9y
OS4KCkZpeGVzOiAwYTRiYjJhYmMzZTUgKCJpMmM6IGRlc2lnbndhcmU6IGRlZmVyIHByb2Jl
IGlmIGNoaWxkIEdwaW9JbnQgY29udHJvbGxlcnMgYXJlIG5vdCBib3VuZCIpCkNjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGpvaGFu
bmVzLmdvZWRlQG9zcy5xdWFsY29tbS5jb20+Ci0tLQogZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1kZXNpZ253YXJlLXBsYXRkcnYuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVz
aWdud2FyZS1wbGF0ZHJ2LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUt
cGxhdGRydi5jCmluZGV4IGM4YTIwM2ZmZjRkMS4uZjgwODE3ZTYyMjFkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtcGxhdGRydi5jCisrKyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1wbGF0ZHJ2LmMKQEAgLTE4MCw2ICsx
ODAsMTMgQEAgc3RhdGljIGludCBjaGVja19jaGlsZF9ncGlvaW50KHN0cnVjdCBhY3BpX2Rl
dmljZSAqYWRldiwgdm9pZCAqZGF0YSkKIAlMSVNUX0hFQUQocmVzX2xpc3QpOwogCWludCBy
ZXQ7CiAKKwlpZiAoIWFkZXYtPnN0YXR1cy5wcmVzZW50KQorCQlyZXR1cm4gMDsKKworCS8q
IFNraXAgYnJva2VuIEludGVsIEJZVC9DSFQgSU5UMzNGRSBiYXR0ZXJ5IGRldmljZXMgKi8K
KwlpZiAoYWNwaV9kZXZfaGlkX21hdGNoKGFkZXYsICJJTlQzM0ZFIikpCisJCXJldHVybiAw
OworCiAJcmV0ID0gYWNwaV9kZXZfZ2V0X3Jlc291cmNlcyhhZGV2LCAmcmVzX2xpc3QsIGNo
ZWNrX2dwaW9pbnRfcmVzb3VyY2UsIE5VTEwpOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4g
cmV0OwotLSAKMi41NS4wCgo=

--------------7fs0YenUPaYs1nN08Jz0k0Fo--
