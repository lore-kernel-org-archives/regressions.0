Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC1D7B
	for <regressions@lists.linux.dev>; Fri, 27 Jan 2023 06:01:12 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id x18so3249540qvl.1
        for <regressions@lists.linux.dev>; Thu, 26 Jan 2023 22:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yOM2BTMQsd5EWc0ETAJrbaPw54YmRb+WPZenE7D1MAs=;
        b=B1O7GWzCLpb7ES011NQvsyQYHrGetlvye7BeYPVbz1dLHB7JAKsOiYuox/cEfuVqGW
         oA2Fr11kphhDlMCBT45qL1R23V8yENT299JIf+JYuuQ9czGPQW8YAHUq1CXPLUwlqwF3
         l3Hog+I+D0RK7E7RS7ndjl3VIvt8uw/D11rARYmOrfvogrr9Hkn3dLwqH50ZrhzWtSc2
         uVUJeHP1n83kcVO24ZNtqISadfWbUtQNQrihvHU7V7P/F+twXyvElNnS5gT3ypuLeNpU
         QxjPa6ScxlrsDvdn/imbiGaQ+mclIZEIspPYzG9HjYBMqDSdN/B6z7tvOLTzgBJLM5WK
         u4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOM2BTMQsd5EWc0ETAJrbaPw54YmRb+WPZenE7D1MAs=;
        b=5wF59qQNwTziV8V5FqF23rWEYHUCU+avMQY9qaCHWWAozNOlavylRDe14TTNI8XHtM
         PNC+s2XEtL4+DMYe9MEk0LvLLrZ4q9djr5YAh26lYf5OY+F/ztnN8z9oJ/XC/Xs+tKiG
         H7gzbakgMqcCB92myeBJzNucjoMyvo+YoYur6+pOaUtTzwLttkxEoK60Cgr3k6Abwond
         KncrT30z6bY6AUyFx9Yqrfjp8nuCTFqkGjKTZyV5cZIqnR1KWShiLxlCb8OXH4XSn4Pi
         O9F0TUhriT3UxqOixT1VUdbboXzC1aCFk1HH46JJhCz6t/3IalbdzO1OK1zo8IAeYkRc
         zz4A==
X-Gm-Message-State: AFqh2kpHds5curcgw5Hxf9pInCzyl6XEk169oqkGa147daAslqAzBl8R
	22OaVpkXitGC21c+wqPdLdbCTq0u6j4mtYMUXmiBygDc
X-Google-Smtp-Source: AMrXdXtwSOFalVBpEg2n39CHs+qTTqaUr5Fmu7CaOqv92Q4SKuQW0kYfF2XJYdGkEXWd6Jqy6qYZWJumjaNAqE1Q8tg=
X-Received: by 2002:a05:6214:5c42:b0:534:1fd4:72ec with SMTP id
 lz2-20020a0562145c4200b005341fd472ecmr1989577qvb.65.1674799271186; Thu, 26
 Jan 2023 22:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop> <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
 <20230116122403.upk5ci4mbebw23m7@wslaptop> <CACAvsv48vH6hbacQCN+yKP8ZcDjFMWciBt6U_Xv-LEYJHZ1q9g@mail.gmail.com>
 <20230120113443.wgwhwp7tm6rnc6je@wslaptop>
In-Reply-To: <20230120113443.wgwhwp7tm6rnc6je@wslaptop>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 27 Jan 2023 16:00:59 +1000
Message-ID: <CACAvsv4_XJLSwnA-s0BXLVbBCESDfnK7kx5-WUPd2+vdJuMojg@mail.gmail.com>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: David Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org, 
	regressions@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	bskeggs@redhat.com, kwizart@gmail.com, kherbst@redhat.com
Content-Type: multipart/mixed; boundary="000000000000a1bc5505f33897c9"

--000000000000a1bc5505f33897c9
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jan 2023 at 21:37, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
>
> On Wed, Jan 18, 2023 at 11:28:49AM +1000, Ben Skeggs wrote:
> > On Mon, 16 Jan 2023 at 22:27, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> > > On Mon, Jan 16, 2023 at 07:45:05AM +1000, David Airlie wrote:
> > > > As a quick check can you try changing
> > > >
> > > > drivers/gpu/drm/nouveau/nvkm/core/firmware.c:nvkm_firmware_mem_target
> > > > from NVKM_MEM_TARGET_HOST to NVKM_MEM_TARGET_NCOH ?
>
> > In addition to Dave's change, can you try changing the
> > nvkm_falcon_load_dmem() call in gm20b_pmu_init() to:
> >
> > nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args,
> > sizeof(args), 0, false);
>
> Hello!
>
> Chiming in just to say that with this change I see the same as Nicolas
> except that the init message size is 255 instead of 0:
>
> [    2.196934] nouveau 57000000.gpu: pmu: unexpected init message size 255 vs 42
I've attached an entirely untested patch (to go on top of the other
hacks/fixes so far), that will hopefully get us a little further.

Would be great if you guys could test it out for me.

Thanks,
Ben.

--000000000000a1bc5505f33897c9
Content-Type: text/x-patch; charset="US-ASCII"; name="gm20b.diff"
Content-Disposition: attachment; filename="gm20b.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lde479jx0>
X-Attachment-Id: f_lde479jx0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZmFsY29uL2dtMjAwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2ZhbGNvbi9nbTIwMC5jCmluZGV4IDM5M2Fk
ZTlmN2U2Yy4uYjdkYTNhYjQ0YzI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL2ZhbGNvbi9nbTIwMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
ZmFsY29uL2dtMjAwLmMKQEAgLTQ4LDYgKzQ4LDE2IEBAIGdtMjAwX2ZsY25fcGlvX2RtZW1fcmQo
c3RydWN0IG52a21fZmFsY29uICpmYWxjb24sIHU4IHBvcnQsIGNvbnN0IHU4ICppbWcsIGludCBs
CiAJCWltZyArPSA0OwogCQlsZW4gLT0gNDsKIAl9CisKKwkvKiBTaWdoLiAgVGVncmEgUE1VIEZX
J3MgaW5pdCBtZXNzYWdlLi4uICovCisJaWYgKGxlbikgeworCQl1MzIgZGF0YSA9IG52a21fZmFs
Y29uX3JkMzIoZmFsY29uLCAweDFjNCArIChwb3J0ICogOCkpOworCisJCXdoaWxlIChsZW4tLSkg
eworCQkJKih1OCAqKWltZysrID0gZGF0YSAmIDB4ZmY7CisJCQlkYXRhID4+PSA4OworCQl9CisJ
fQogfQogCiBzdGF0aWMgdm9pZApAQCAtNjQsNiArNzQsOCBAQCBnbTIwMF9mbGNuX3Bpb19kbWVt
X3dyKHN0cnVjdCBudmttX2ZhbGNvbiAqZmFsY29uLCB1OCBwb3J0LCBjb25zdCB1OCAqaW1nLCBp
bnQgbAogCQlpbWcgKz0gNDsKIAkJbGVuIC09IDQ7CiAJfQorCisJV0FSTl9PTihsZW4pOwogfQog
CiBzdGF0aWMgdm9pZApAQCAtNzQsNyArODYsNyBAQCBnbTIwMF9mbGNuX3Bpb19kbWVtX3dyX2lu
aXQoc3RydWN0IG52a21fZmFsY29uICpmYWxjb24sIHU4IHBvcnQsIGJvb2wgc2VjLCB1MzIgZAog
CiBjb25zdCBzdHJ1Y3QgbnZrbV9mYWxjb25fZnVuY19waW8KIGdtMjAwX2ZsY25fZG1lbV9waW8g
PSB7Ci0JLm1pbiA9IDQsCisJLm1pbiA9IDEsCiAJLm1heCA9IDB4MTAwLAogCS53cl9pbml0ID0g
Z20yMDBfZmxjbl9waW9fZG1lbV93cl9pbml0LAogCS53ciA9IGdtMjAwX2ZsY25fcGlvX2RtZW1f
d3IsCg==
--000000000000a1bc5505f33897c9--
